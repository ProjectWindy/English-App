import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speak_up/data/providers/app_language_provider.dart';
import 'package:speak_up/data/providers/app_navigator_provider.dart';
import 'package:speak_up/data/providers/app_theme_provider.dart';
import 'package:speak_up/data/repositories/firestore/firestore_repository.dart';
import 'package:speak_up/domain/use_cases/account_settings/get_app_theme_use_case.dart';
import 'package:speak_up/domain/use_cases/account_settings/save_app_language_use_case.dart';
import 'package:speak_up/domain/use_cases/account_settings/switch_app_theme_use_case.dart';
import 'package:speak_up/domain/use_cases/authentication/sign_out_use_case.dart';
import 'package:speak_up/injection/injector.dart';
import 'package:speak_up/presentation/navigation/app_routes.dart';
import 'package:speak_up/presentation/pages/chat/chat_view.dart';
import 'package:speak_up/presentation/pages/profile/profile_state.dart';
import 'package:speak_up/presentation/pages/profile/profile_view_model.dart';
import 'package:speak_up/presentation/resources/app_icons.dart';
import 'package:speak_up/presentation/resources/app_images.dart';
import 'package:speak_up/presentation/utilities/enums/language.dart';
import 'package:speak_up/presentation/widgets/loading_indicator/app_loading_indicator.dart';

import 'package:speak_up/data/repositories/local_database/local_dtb.dart';

 class ActivityViewModel extends StateNotifier<List<String>> {
  final UserActivityManager _userActivityManager;

  ActivityViewModel(this._userActivityManager) : super([]);

  Future<void> recordActivity() async {
    await _userActivityManager.recordUserActivity();
    await fetchUserActivity();
  }

  Future<void> fetchUserActivity() async {
    final activityData = await _userActivityManager.getUserActivity();
    List<String> activities = [
      'Số ngày truy cập: ${activityData['daysVisited']}',
      'Tổng số giờ học hiện tại: ${activityData['totalHours']}',
    ];
    state = activities;
  }
}

 final activityViewModelProvider =
    StateNotifierProvider<ActivityViewModel, List<String>>((ref) {
  final firestoreRepository = FirestoreRepository(FirebaseFirestore.instance);
  return ActivityViewModel(UserActivityManager(firestoreRepository));
});


class ProgressTrackingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(activityViewModelProvider.notifier).recordActivity();

    final userActivities = ref.watch(activityViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hoạt động',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theo dõi tiến độ luyện tập!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
             SizedBox(height: 20),
            _buildStatsRow(userActivities),
            SizedBox(height: 20),
             SizedBox(height: 20),
            Text(
              'Hoạt động gần đây:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildUserActivities(userActivities),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatView()),
          );
        },
        child: Image.asset('assets/images/chatbot.png'),
      ),
    );
  }

  Widget _buildTimeOption(String title, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple[300] : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purple[300]!),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildStatsRow(List<String> userActivities) {
    int numberOfDays = userActivities.length;

    int totalHours = userActivities.fold(0, (sum, activity) {
      return sum + _getHoursFromActivity(activity);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard(
            numberOfDays.toString(), 'Số ngày duy trì', Colors.blue[300]!),
        _buildStatCard(
            totalHours.toString(), 'Số giờ đã học', Colors.orange[300]!),
      ],
    );
  }

  int _getHoursFromActivity(String activity) {
    List<String> parts = activity.split(':');
    if (parts.length > 1) {
      return int.tryParse(parts[1].trim()) ?? 0;
    }
    return 0;
  }

  Widget _buildStatCard(String value, String title, Color color) {
    return Container(
      width: 150,
      height: 120,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Không có dữ liệu vì bạn vẫn chưa luyện tập trong 7 ngày qua',
          style: TextStyle(color: Colors.black87, fontSize: 14),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) => _buildDayBox(index)),
        ),
      ],
    );
  }

  Widget _buildDayBox(int index) {
    List<String> days = ['Th 2', 'Th 3', 'Th 4', 'Th 5', 'Th 6', 'Th 7', 'CN'];
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Center(
        child: Text(
          days[index],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildUserActivities(List<String> activities) {
    if (activities.isEmpty) {
      return Text('Không có hoạt động nào trong thời gian gần đây.');
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(activities[index]),
          leading: Icon(Icons.check_circle, color: Colors.green),
        );
      },
    );
  }
}

final profileViewModelProvider =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>((ref) =>
        ProfileViewModel(
            injector.get<GetAppThemeUseCase>(),
            injector.get<SwitchAppThemeUseCase>(),
            injector.get<SignOutUseCase>()));

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfileViewState();
}

class ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(profileViewModelProvider.notifier).getThemeData();
    });
  }

  Future<void> _buildLogoutDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logOut),
          content: Text(
            AppLocalizations.of(context)!.areYouSureYouWantToLogOut,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16.0),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                AppLocalizations.of(context)!.yes,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(14.0),
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await ref.read(profileViewModelProvider.notifier).signOut();
                Future.delayed(const Duration(seconds: 1), () {
                  ref
                      .read(appNavigatorProvider)
                      .navigateTo(AppRoutes.onboarding, shouldClearStack: true);
                });
              },
            ),
            const SizedBox(width: 8),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                AppLocalizations.of(context)!.no,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onTapChangeLanguage(WidgetRef ref) async {
    final isDarkTheme = ref.watch(themeProvider);
    switch (await showDialog<Language>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16.0),
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.english);
                },
                child: ListTile(
                    leading: AppImages.usFlag(),
                    title: Text(
                      Language.english.toLanguageString(),
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black,
                        fontSize: ScreenUtil().setSp(14.0),
                      ),
                    )),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Language.vietnamese);
                },
                child: ListTile(
                    leading: AppImages.vnFlag(),
                    title: Text(
                      Language.vietnamese.toLanguageString(),
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black,
                        fontSize: ScreenUtil().setSp(14.0),
                      ),
                    )),
              ),
            ],
          );
        })) {
      case Language.english:
        ref.read(appLanguageProvider.notifier).state = Language.english;
        break;
      case Language.vietnamese:
        ref.read(appLanguageProvider.notifier).state = Language.vietnamese;
        break;
      case null:
         break;
    }
    injector
        .get<SaveAppLanguageUseCase>()
        .run(ref.read(appLanguageProvider.notifier).state);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileViewModelProvider);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context)!.accountSettings,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
              )),
          actions: [
            IconButton(
              onPressed: () async {
                await _buildLogoutDialogBuilder(context);
              },
              icon: Icon(Icons.logout,
                  color: Colors.red, size: ScreenUtil().setHeight(24)),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: CircleAvatar(
                          radius: ScreenUtil().setHeight(24),
                          child: ClipOval(
                            child: user?.photoURL != null
                                ? Image.network(user!.photoURL!)
                                : AppImages.avatar(),
                          ),
                        ),
                      ),
                      Text(
                        user?.displayName ?? '',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildListTile(AppIcons.avatar(size: 48),
                          AppLocalizations.of(context)!.editProfile, onTap: () {
                        ref
                            .read(appNavigatorProvider)
                            .navigateTo(AppRoutes.editProfile);
                      }),
                      if (user?.providerData[0].providerId == 'password')
                        buildListTile(AppIcons.changePassword(size: 48),
                            AppLocalizations.of(context)!.changePassword,
                            onTap: () {
                          ref
                              .read(appNavigatorProvider)
                              .navigateTo(AppRoutes.changePassword);
                        }),
                      buildListTile(AppIcons.darkMode(size: 48),
                          AppLocalizations.of(context)!.darkMode,
                          trailing: Switch(
                            value: state.isDarkMode,
                            onChanged: (value) {
                              ref
                                  .read(profileViewModelProvider.notifier)
                                  .changeThemeData(value);
                              ref.read(themeProvider.notifier).state = value;
                            },
                          )),
                      buildListTile(
                        AppIcons.changeLanguage(size: 48),
                        AppLocalizations.of(context)!.language,
                        trailing:
                            ref.watch(appLanguageProvider) == Language.english
                                ? AppImages.usFlag()
                                : AppImages.vnFlag(),
                        onTap: () {
                          _onTapChangeLanguage(ref);
                          injector.get<SaveAppLanguageUseCase>().run(
                              ref.read(appLanguageProvider.notifier).state);
                        },
                      ),
                      buildListTile(AppIcons.about(size: 48),
                          AppLocalizations.of(context)!.about, onTap: () {
                        ref
                            .read(appNavigatorProvider)
                            .navigateTo(AppRoutes.about);
                      }),
                      buildListTile(
                        AppIcons.logout(size: 46),
                        AppLocalizations.of(context)!.logOut,
                        onTap: () async {
                          await _buildLogoutDialogBuilder(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (state.isSigningOut) const AppLoadingIndicator(),
          ],
        ));
  }

  Widget buildListTile(Widget icon, String title,
      {Widget? trailing, Function()? onTap}) {
    final darkTheme = ref.watch(themeProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: const BoxDecoration(),
      child: ListTile(
        leading: icon,
        contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(8),
            vertical: ScreenUtil().setHeight(4)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            color: darkTheme ? Colors.white : Colors.black,
          ),
        ),
        onTap: onTap,
        trailing: trailing ??
            const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
      ),
    );
  }
}
