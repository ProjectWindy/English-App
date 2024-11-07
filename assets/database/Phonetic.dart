class Phonetic {
  final int phoneticID;
  final String phonetic;
  final String phoneticExample;
  final String youtubeVideoID;
  final String example;
  final String description;

  Phonetic({
    required this.phoneticID,
    required this.phonetic,
    required this.phoneticExample,
    required this.youtubeVideoID,
    required this.example,
    required this.description,
  });
}

final List<Phonetic> phoneticData = [
  Phonetic(
    phoneticID: 1,
    phonetic: "/ɪ/",
    phoneticExample: "i",
    youtubeVideoID: "TNFKG0yvDx4",
    example: "{'it': '/ɪt/', 'sit': '/sɪt/', 'ship': '/ʃɪp/'}",
    description:
        "Âm 'i' ngắn phát âm giống âm 'i' của tiếng Việt nhưng phát âm nhanh hơn.",
  ),
  Phonetic(
    phoneticID: 2,
    phonetic: "/ʊ/",
    phoneticExample: "u",
    youtubeVideoID: "eJ7dM_LU9t4",
    example: "{'look': '/lʊk/', 'cook': '/kʊk/', 'foot': '/fʊt/'}",
    description:
        "Âm 'u' ngắn, na ná âm 'ư' của tiếng Việt, không đứng riêng lẻ.",
  ),
  Phonetic(
    phoneticID: 3,
    phonetic: "/e/",
    phoneticExample: "e",
    youtubeVideoID: "hLN1cdsTDo8",
    example: "{'pen': '/pen/', 'bed': '/bed/', 'ten': '/ten/'}",
    description: "Giống âm 'e' của tiếng Việt nhưng phát âm rất ngắn.",
  ),
  Phonetic(
    phoneticID: 4,
    phonetic: "/æ/",
    phoneticExample: "a",
    youtubeVideoID: "wg0poYokniE",
    example: "{'cat': '/kæt/', 'dad': '/dæd/', 'fat': '/fæt/'}",
    description: "Âm 'a bẹt', hơi lai giữa âm 'a' và 'e', âm giác âm ở giữa.",
  ),
  Phonetic(
    phoneticID: 5,
    phonetic: "/ɑː/",
    phoneticExample: "ah",
    youtubeVideoID: "aBc0fK5gYkg",
    example: "{'father': '/ˈfɑːðər/', 'car': '/kɑːr/', 'arm': '/ɑːrm/'}",
    description: "Âm 'a' dài, phát âm trầm và giữ hơi lâu hơn.",
  ),
  Phonetic(
    phoneticID: 6,
    phonetic: "/ɔː/",
    phoneticExample: "or",
    youtubeVideoID: "xFgP1DdFGz4",
    example: "{'law': '/lɔː/', 'saw': '/sɔː/', 'thought': '/θɔːt/'}",
    description: "Âm 'o' tròn và dài, môi mở rộng và phát âm sâu.",
  ),
  Phonetic(
    phoneticID: 7,
    phonetic: "/ʌ/",
    phoneticExample: "uh",
    youtubeVideoID: "Ud3ct5lMTzU",
    example: "{'cup': '/kʌp/', 'luck': '/lʌk/', 'run': '/rʌn/'}",
    description: "Giống âm 'â' của tiếng Việt, phát âm ngắn.",
  ),
  Phonetic(
    phoneticID: 8,
    phonetic: "/ɜː/",
    phoneticExample: "er",
    youtubeVideoID: "eJ7M1v89Yz4",
    example: "{'bird': '/bɜːd/', 'word': '/wɜːd/', 'girl': '/ɡɜːl/'}",
    description: "Âm 'ơ' dài, âm thanh phát ra từ cổ họng, môi thả lỏng.",
  ),
  Phonetic(
    phoneticID: 9,
    phonetic: "/ə/",
    phoneticExample: "schwa",
    youtubeVideoID: "PZ34s9pZeGU",
    example: "{'sofa': '/ˈsəʊfə/', 'banana': '/bəˈnænə/', 'sugar': '/ˈʃʊɡə/'}",
    description: "Âm 'ơ' ngắn, rất nhẹ, thường xuất hiện trong âm không nhấn.",
  ),
  Phonetic(
    phoneticID: 10,
    phonetic: "/iː/",
    phoneticExample: "ee",
    youtubeVideoID: "6Cp78_Rx6H0",
    example: "{'see': '/siː/', 'tree': '/triː/', 'me': '/miː/'}",
    description: "Giống âm 'i' dài, môi hơi cười, kéo dài âm thanh.",
  ),
  Phonetic(
    phoneticID: 11,
    phonetic: "/uː/",
    phoneticExample: "oo",
    youtubeVideoID: "7JtO8vgHhhM",
    example: "{'food': '/fuːd/', 'blue': '/bluː/', 'two': '/tuː/'}",
    description: "Giống âm 'u' dài, môi tròn và phát âm sâu.",
  ),
  Phonetic(
    phoneticID: 12,
    phonetic: "/b/",
    phoneticExample: "b",
    youtubeVideoID: "4BQJFDH0NoY",
    example: "{'bat': '/bæt/', 'cab': '/kæb/', 'table': '/ˈteɪbəl/'}",
    description: "Đặt môi lại với nhau và phát âm ra âm 'b' ngắn.",
  ),
  Phonetic(
    phoneticID: 13,
    phonetic: "/d/",
    phoneticExample: "d",
    youtubeVideoID: "NtZhT_t0ZJg",
    example: "{'dog': '/dɔɡ/', 'sad': '/sæd/', 'bed': '/bɛd/'}",
    description: "Đặt đầu lưỡi chạm vào răng trên, tạo âm 'd' ngắn.",
  ),
  Phonetic(
    phoneticID: 14,
    phonetic: "/f/",
    phoneticExample: "f",
    youtubeVideoID: "fI8Z6pH6a_k",
    example: "{'fish': '/fɪʃ/', 'safe': '/seɪf/', 'coffee': '/ˈkɒfi/'}",
    description: "Đặt răng trên lên môi dưới, thổi ra để tạo âm 'f'.",
  ),
  Phonetic(
    phoneticID: 15,
    phonetic: "/g/",
    phoneticExample: "g",
    youtubeVideoID: "zH_3nlnx6yQ",
    example: "{'go': '/ɡoʊ/', 'flag': '/flæɡ/', 'big': '/bɪɡ/'}",
    description: "Phát âm bằng cách tạo âm sâu trong cổ họng.",
  ),
  Phonetic(
    phoneticID: 16,
    phonetic: "/h/",
    phoneticExample: "h",
    youtubeVideoID: "qYtY4dyZs60",
    example: "{'hat': '/hæt/', 'home': '/hoʊm/', 'hello': '/həˈloʊ/'}",
    description: "Âm thanh thoát ra từ cổ họng nhẹ nhàng.",
  ),
  Phonetic(
    phoneticID: 17,
    phonetic: "/j/",
    phoneticExample: "y",
    youtubeVideoID: "LlZcdL7aQGg",
    example: "{'yes': '/jɛs/', 'yellow': '/ˈjɛloʊ/', 'yard': '/jɑrd/'}",
    description:
        "Âm 'j' tương tự âm 'y' trong tiếng Việt, phát âm từ vòm họng.",
  ),
  Phonetic(
    phoneticID: 18,
    phonetic: "/k/",
    phoneticExample: "k",
    youtubeVideoID: "2u3e2qN7J_M",
    example: "{'cat': '/kæt/', 'key': '/kiː/', 'back': '/bæk/'}",
    description: "Tạo âm 'k' ngắn từ cổ họng, giống âm 'k' trong tiếng Việt.",
  ),
  Phonetic(
    phoneticID: 19,
    phonetic: "/l/",
    phoneticExample: "l",
    youtubeVideoID: "mtNkBwO8f28",
    example: "{'lamp': '/læmp/', 'call': '/kɔːl/', 'fall': '/fɔːl/'}",
    description: "Âm 'l' phát ra khi đầu lưỡi chạm vào vòm miệng trên.",
  ),
  Phonetic(
    phoneticID: 20,
    phonetic: "/m/",
    phoneticExample: "m",
    youtubeVideoID: "rH5qZLFJQlE",
    example: "{'man': '/mæn/', 'home': '/hoʊm/', 'come': '/kʌm/'}",
    description: "Đặt môi lại với nhau và tạo âm 'm' ngắn.",
  ),
  Phonetic(
    phoneticID: 21,
    phonetic: "/n/",
    phoneticExample: "n",
    youtubeVideoID: "IgPj8a_MQAs",
    example: "{'name': '/neɪm/', 'pen': '/pɛn/', 'ten': '/tɛn/'}",
    description: "Âm 'n' ngắn, tạo âm thanh từ mũi.",
  ),
  Phonetic(
    phoneticID: 22,
    phonetic: "/ŋ/",
    phoneticExample: "ng",
    youtubeVideoID: "b0-a3Hqyb5E",
    example: "{'sing': '/sɪŋ/', 'long': '/lɔːŋ/', 'ring': '/rɪŋ/'}",
    description: "Tạo âm từ phía cuối lưỡi, giống âm 'ng' tiếng Việt.",
  ),
  Phonetic(
    phoneticID: 23,
    phonetic: "/p/",
    phoneticExample: "p",
    youtubeVideoID: "Pg6AXXfOWcA",
    example: "{'pen': '/pɛn/', 'cup': '/kʌp/', 'apple': '/ˈæpəl/'}",
    description: "Giống âm 'p' trong tiếng Việt, phát âm ngắn.",
  ),
  Phonetic(
    phoneticID: 23,
    phonetic: "/p/",
    phoneticExample: "p",
    youtubeVideoID: "Pg6AXXfOWcA",
    example: "{'pen': '/pɛn/', 'cup': '/kʌp/', 'apple': '/ˈæpəl/'}",
    description: "Âm 'p' ngắn, môi khép lại rồi mở ra nhanh chóng.",
  ),
  Phonetic(
    phoneticID: 24,
    phonetic: "/r/",
    phoneticExample: "r",
    youtubeVideoID: "LKH9pxOB_F0",
    example: "{'red': '/rɛd/', 'car': '/kɑːr/', 'far': '/fɑːr/'}",
    description: "Đầu lưỡi hơi cong, không chạm vòm miệng.",
  ),
  Phonetic(
    phoneticID: 25,
    phonetic: "/s/",
    phoneticExample: "s",
    youtubeVideoID: "tIx8HkBM9T8",
    example: "{'see': '/siː/', 'sit': '/sɪt/', 'miss': '/mɪs/'}",
    description: "Âm 's' được phát ra khi đẩy hơi qua kẽ răng.",
  ),
  Phonetic(
    phoneticID: 26,
    phonetic: "/t/",
    phoneticExample: "t",
    youtubeVideoID: "m6nG5f0vweI",
    example: "{'top': '/tɒp/', 'bat': '/bæt/', 'cat': '/kæt/'}",
    description: "Đầu lưỡi chạm vào nướu trên và bật ra.",
  ),
  Phonetic(
    phoneticID: 27,
    phonetic: "/v/",
    phoneticExample: "v",
    youtubeVideoID: "1MOwj3RxmnQ",
    example: "{'van': '/væn/', 'save': '/seɪv/', 'love': '/lʌv/'}",
    description: "Răng trên chạm môi dưới, tạo âm 'v' ngắn.",
  ),
  Phonetic(
    phoneticID: 28,
    phonetic: "/w/",
    phoneticExample: "w",
    youtubeVideoID: "omjrd7mxFuw",
    example: "{'water': '/ˈwɔːtər/', 'win': '/wɪn/', 'wait': '/weɪt/'}",
    description: "Môi tròn, phát âm giống âm 'w' trong 'water'.",
  ),
  Phonetic(
    phoneticID: 29,
    phonetic: "/z/",
    phoneticExample: "z",
    youtubeVideoID: "hKZ0sG1wfI0",
    example: "{'zoo': '/zuː/', 'buzz': '/bʌz/', 'has': '/hæz/'}",
    description: "Giống âm 's' nhưng phát âm với thanh âm từ cổ họng.",
  ),
  Phonetic(
    phoneticID: 30,
    phonetic: "/θ/",
    phoneticExample: "th",
    youtubeVideoID: "WdWZ7Y_9joI",
    example: "{'think': '/θɪŋk/', 'thank': '/θæŋk/', 'both': '/boʊθ/'}",
    description: "Đầu lưỡi đặt giữa răng và thổi nhẹ ra.",
  ),
  Phonetic(
    phoneticID: 31,
    phonetic: "/ð/",
    phoneticExample: "th",
    youtubeVideoID: "9jxrb8n6v7Q",
    example: "{'this': '/ðɪs/', 'that': '/ðæt/', 'mother': '/ˈmʌðər/'}",
    description: "Phát âm giống âm /θ/ nhưng có âm rung ở cổ họng.",
  ),
  Phonetic(
    phoneticID: 32,
    phonetic: "/ʃ/",
    phoneticExample: "sh",
    youtubeVideoID: "IZUbzRuQwF8",
    example: "{'she': '/ʃiː/', 'fish': '/fɪʃ/', 'wish': '/wɪʃ/'}",
    description: "Phát âm như âm 'sh' của tiếng Anh, đẩy hơi qua răng.",
  ),
  Phonetic(
    phoneticID: 33,
    phonetic: "/ʒ/",
    phoneticExample: "zh",
    youtubeVideoID: "YIv2ZZt3wNU",
    example: "{'measure': '/ˈmɛʒər/', 'treasure': '/ˈtrɛʒər/'}",
    description: "Phát âm giống âm /ʃ/ nhưng có âm rung.",
  ),
  Phonetic(
    phoneticID: 34,
    phonetic: "/tʃ/",
    phoneticExample: "ch",
    youtubeVideoID: "XbBWT3aU9Jk",
    example: "{'cheese': '/tʃiːz/', 'watch': '/wɒtʃ/', 'teach': '/tiːtʃ/'}",
    description: "Phát âm như âm 'ch' của tiếng Việt.",
  ),
  Phonetic(
    phoneticID: 35,
    phonetic: "/dʒ/",
    phoneticExample: "j",
    youtubeVideoID: "kuywLnInBfM",
    example: "{'jungle': '/ˈdʒʌŋɡəl/', 'judge': '/dʒʌdʒ/', 'page': '/peɪdʒ/'}",
    description: "Phát âm như âm 'gi' của tiếng Việt.",
  ),
  Phonetic(
    phoneticID: 36,
    phonetic: "/aɪ/",
    phoneticExample: "i",
    youtubeVideoID: "kIoacBaWM0w",
    example: "{'my': '/maɪ/', 'like': '/laɪk/', 'sky': '/skaɪ/'}",
    description: "Âm đôi kết hợp 'a' và 'ɪ', phát âm nhanh.",
  ),
  Phonetic(
    phoneticID: 37,
    phonetic: "/aʊ/",
    phoneticExample: "ow",
    youtubeVideoID: "WT8QCtSbn18",
    example: "{'now': '/naʊ/', 'down': '/daʊn/', 'how': '/haʊ/'}",
    description: "Âm đôi giữa 'a' và 'u', môi tròn dần khi phát âm.",
  ),
  Phonetic(
    phoneticID: 38,
    phonetic: "/eɪ/",
    phoneticExample: "ay",
    youtubeVideoID: "70p1UbNZfF4",
    example: "{'day': '/deɪ/', 'say': '/seɪ/', 'play': '/pleɪ/'}",
    description: "Âm đôi giữa 'e' và 'ɪ', môi hơi mở.",
  ),
  Phonetic(
    phoneticID: 39,
    phonetic: "/oʊ/",
    phoneticExample: "oh",
    youtubeVideoID: "lnX6HAp5Z7U",
    example: "{'go': '/ɡoʊ/', 'show': '/ʃoʊ/', 'low': '/loʊ/'}",
    description: "Âm đôi giữa 'o' và 'ʊ', môi tròn dần khi phát âm.",
  ),
  Phonetic(
    phoneticID: 40,
    phonetic: "/ɔɪ/",
    phoneticExample: "oi",
    youtubeVideoID: "8Qj8q3M1y7s",
    example: "{'boy': '/bɔɪ/', 'toy': '/tɔɪ/', 'enjoy': '/ɪnˈdʒɔɪ/'}",
    description: "Âm đôi giữa 'ɔ' và 'ɪ', phát âm giống âm 'oi'.",
  ),
  Phonetic(
    phoneticID: 41,
    phonetic: "/ɪə/",
    phoneticExample: "ear",
    youtubeVideoID: "5jOaTEJ2XK4",
    example: "{'here': '/hɪə/', 'near': '/nɪə/', 'dear': '/dɪə/'}",
    description: "Âm đôi giữa 'ɪ' và 'ə', phát âm giống 'ia'.",
  ),
  Phonetic(
    phoneticID: 42,
    phonetic: "/eə/",
    phoneticExample: "air",
    youtubeVideoID: "xg9F7pTgLJo",
    example: "{'air': '/eə/', 'care': '/keə/', 'share': '/ʃeə/'}",
    description: "Âm đôi giữa 'e' và 'ə', giống âm 'e' kéo dài.",
  ),
  Phonetic(
    phoneticID: 43,
    phonetic: "/ʊə/",
    phoneticExample: "ure",
    youtubeVideoID: "uhXH3SZtQls",
    example: "{'sure': '/ʃʊə/', 'pure': '/pjʊə/', 'tour': '/tʊə/'}",
    description: "Âm đôi giữa 'ʊ' và 'ə', môi hơi tròn.",
  ),
  Phonetic(
    phoneticID: 44,
    phonetic: "/əʊ/",
    phoneticExample: "ou",
    youtubeVideoID: "xn9-eMiNb2A",
    example: "{'go': '/ɡəʊ/', 'no': '/nəʊ/', 'so': '/səʊ/'}",
    description: "Âm đôi giữa 'ə' và 'ʊ', giống âm 'âu' trong tiếng Việt.",
  ),
];