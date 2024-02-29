import 'package:flutter/material.dart';
import 'package:mwaslaty/data/reposotries/quran%20records%20repo/quran_records_impl.dart';

import '../../domain/model/api models/quran_records_model.dart';
import '../../domain/reposotries/quran records repo/quran_records_repo.dart';
import 'package:audioplayers/audioplayers.dart';

class BodcastScreenVM extends ChangeNotifier {
  bool isUploading = false;
  bool isError = false;
  String errorMessage = '';
  List<QuranRecords> quranRec = [];
  final QuranRecordsRepo _myRepo = QuranRecoordsImpl();

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void fetchQuranRecords() async {
    isUploading = true;
    final quranRecordsResponse = await _myRepo.fetchQuranData();
    notifyListeners();
    quranRecordsResponse.fold((l) {
      isUploading = false;
      isError = true;
      errorMessage = l.message;
      notifyListeners();
    }, (r) {
      isUploading = false;
      quranRec = r.reciters!;
      notifyListeners();
    });
  }

  List<String> getSouranum(String sura) {
    return sura.split(',');
  }

  String generateAudioUrl(String server, int suraNumber) {
    // Ensure that the suraNumber is formatted as a three-digit number
    String formattedSuraNumber = suraNumber.toString().padLeft(3, '0');

    // Construct the audio URL
    String audioUrl = "$server/$formattedSuraNumber.mp3";
    return audioUrl;
  }

  void playAudio(String audioUrl) async {
    await audioPlayer.play(UrlSource(audioUrl));
  }

  void stopAudio() async {
    await audioPlayer.pause();
  }

  void resumeAudio() async {
    await audioPlayer.resume();
  }

  String getSurahName(int surahNumber) {
    switch (surahNumber) {
      case 1:
        return 'الفاتحة'; // Surah Al-Fatihah
      case 2:
        return 'البقرة'; // Surah Al-Baqarah
      case 3:
        return 'آل عمران'; // Surah Aal-E-Imran
      case 4:
        return 'النساء'; // Surah An-Nisa'
      case 5:
        return 'المائدة'; // Surah Al-Ma'idah
      case 6:
        return 'الأنعام'; // Surah Al-An'am
      case 7:
        return 'الأعراف'; // Surah Al-A'raf
      case 8:
        return 'الأنفال'; // Surah Al-Anfal
      case 9:
        return 'التوبة'; // Surah At-Tawbah
      case 10:
        return 'يونس'; // Surah Yunus
      case 11:
        return 'هود'; // Surah Hud
      case 12:
        return 'يوسف'; // Surah Yusuf
      case 13:
        return 'الرعد'; // Surah Ar-Ra'd
      case 14:
        return 'إبراهيم'; // Surah Ibrahim
      case 15:
        return 'الحجر'; // Surah Al-Hijr
      case 16:
        return 'النحل'; // Surah An-Nahl
      case 17:
        return 'الإسراء'; // Surah Al-Isra'
      case 18:
        return 'الكهف'; // Surah Al-Kahf
      case 19:
        return 'مريم'; // Surah Maryam
      case 20:
        return 'طه'; // Surah Ta-Ha
      case 21:
        return 'الأنبياء'; // Surah Al-Anbiya'
      case 22:
        return 'الحشر'; // Surah Al-Hashr
      case 23:
        return 'المؤمنون'; // Surah Al-Mu'minun
      case 24:
        return 'النور'; // Surah An-Nur
      case 25:
        return 'الفرقان'; // Surah Al-Furqan
      case 26:
        return 'الشعراء'; // Surah Ash-Shu'ara
      case 27:
        return 'النمل'; // Surah An-Naml
      case 28:
        return 'القصص'; // Surah Al-Qasas
      case 29:
        return 'العنكبوت'; // Surah Al-Ankabut
      case 30:
        return 'الروم'; // Surah Ar-Rum
      case 31:
        return 'لقمان'; // Surah Luqman
      case 32:
        return 'السجدة'; // Surah As-Sajda
      case 33:
        return 'الأحزاب'; // Surah Al-Ahzab
      case 34:
        return 'سبأ'; // Surah Saba'
      case 35:
        return 'فاطر'; // Surah Fatir
      case 36:
        return 'يس'; // Surah Ya-Sin
      case 37:
        return 'الصافات'; // Surah As-Saffat
      case 38:
        return 'ص'; // Surah Sad
      case 39:
        return 'الزمر'; // Surah Az-Zumar
      case 40:
        return 'غافر'; // Surah Ghafir
      case 41:
        return 'فصلت'; // Surah Fussilat
      case 42:
        return 'الشورى'; // Surah Ash-Shura
      case 43:
        return 'الزخرف'; // Surah Az-Zukhruf
      case 44:
        return 'الدخان'; // Surah Ad-Dukhan
      case 45:
        return 'الجاثية'; // Surah Al-Jathiya
      case 46:
        return 'الأحقاف'; // Surah Al-Ahqaf
      case 47:
        return 'محمد'; // Surah Muhammad
      case 48:
        return 'الفتح'; // Surah Al-Fath
      case 49:
        return 'الحجرات'; // Surah Al-Hujurat
      case 50:
        return 'ق'; // Surah Qaf
      case 51:
        return 'الذاريات'; // Surah Adh-Dhariyat
      case 52:
        return 'الطور'; // Surah At-Tur
      case 53:
        return 'النجم'; // Surah An-Najm
      case 54:
        return 'القمر'; // Surah Al-Qamar
      case 55:
        return 'الرحمن'; // Surah Ar-Rahman
      case 56:
        return 'الواقعة'; // Surah Al-Waqi'a
      case 57:
        return 'الحديد'; // Surah Al-Hadid
      case 58:
        return 'المجادلة'; // Surah Al-Mujadila
      case 59:
        return 'الحشر'; // Surah Al-Hashr
      case 60:
        return 'الممتحنة'; // Surah Al-Mumtahina
      case 61:
        return 'الصف'; // Surah As-Saff
      case 62:
        return 'الجمعة'; // Surah Al-Jumu'a
      case 63:
        return 'المنافقون'; // Surah Al-Munafiqun
      case 64:
        return 'التغابن'; // Surah At-Taghabun
      case 65:
        return 'الطلاق'; // Surah At-Talaq
      case 66:
        return 'التحريم'; // Surah At-Tahrim
      case 67:
        return 'الملك'; // Surah Al-Mulk
      case 68:
        return 'القلم'; // Surah Al-Qalam
      case 69:
        return 'الحاقة'; // Surah Al-Haaqqa
      case 70:
        return 'المعارج'; // Surah Al-Ma'arij
      case 71:
        return 'نوح'; // Surah Nuh
      case 72:
        return 'الجن'; // Surah Al-Jinn
      case 73:
        return 'المزمل'; // Surah Al-Muzzammil
      case 74:
        return 'المدثر'; // Surah Al-Muddathir
      case 75:
        return 'القيامة'; // Surah Al-Qiyama
      case 76:
        return 'الإنسان'; // Surah Al-Insan
      case 77:
        return 'المرسلات'; // Surah Al-Mursalat
      case 78:
        return 'النبأ'; // Surah An-Naba'
      case 79:
        return 'النازعات'; // Surah An-Nazi'at
      case 80:
        return 'عبس'; // Surah Abasa
      case 81:
        return 'التكوير'; // Surah At-Takwir
      case 82:
        return 'الإنفطار'; // Surah Al-Infitar
      case 83:
        return 'المطففين'; // Surah Al-Mutaffifin
      case 84:
        return 'الإنشقاق'; // Surah Al-Inshiqaq
      case 85:
        return 'البروج'; // Surah Al-Buruj
      case 86:
        return 'الطارق'; // Surah At-Tariq
      case 87:
        return 'الأعلى'; // Surah Al-Ala
      case 88:
        return 'الغاشية'; // Surah Al-Ghashiya
      case 89:
        return 'الفجر'; // Surah Al-Fajr
      case 90:
        return 'البلد'; // Surah Al-Balad
      case 91:
        return 'الشمس'; // Surah Ash-Shams
      case 92:
        return 'الليل'; // Surah Al-Layl
      case 93:
        return 'الضحى'; // Surah Adh-Dhuha
      case 94:
        return 'الشرح'; // Surah Ash-Sharh
      case 95:
        return 'التين'; // Surah At-Tin
      case 96:
        return 'العلق'; //
      case 97:
        return 'البينة';
      case 98:
        return 'البينة';
      case 99:
        return "الزلزلة";
      case 100:
        return 'العاديات';
      case 101:
        return 'القارعة';
      case 102:
        return 'التكاثر';
      case 103:
        return "العصر";
      case 104:
        return "الهمزة";
      case 105:
        return "الفيل";
      case 106:
        return "قريش";
      case 107:
        return "الماعون";
      case 108:
        return "الكوثر";
      case 109:
        return "الكافرون";
      case 110:
        return "النصر";
      case 111:
        return "المسد";
      case 112:
        return "الاخلاص";
      case 113:
        return "الفلق";
      case 114:
        return "الناس";
      default:
        return '';
    }
  }
}
