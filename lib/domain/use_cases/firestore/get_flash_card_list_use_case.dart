import 'package:speak_up/data/repositories/authentication/authentication_repository.dart';
import 'package:speak_up/data/repositories/firestore/firestore_repository.dart';
import 'package:speak_up/domain/entities/flash_card/flash_card.dart';
import 'package:speak_up/domain/use_cases/use_case.dart';
import 'package:speak_up/injection/injector.dart';

class GetFlashCardListUseCase extends FutureOutputUseCase<List<FlashCard>> {
  @override
  Future<List<FlashCard>> run() {
    String uid = injector.get<AuthenticationRepository>().getCurrentUser().uid;
    return injector.get<FirestoreRepository>().getFlashCardList(uid);
  }
}
