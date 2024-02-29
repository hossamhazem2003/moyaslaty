import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../domain/model/api models/quran_records_model.dart';
import '../../../domain/model/faliure.dart';
import '../../../domain/reposotries/quran records repo/quran_records_repo.dart';
import 'package:http/http.dart' as http;

class QuranRecoordsImpl extends QuranRecordsRepo {
  @override
  Future<Either<Failure, QuranModel>> fetchQuranData() async {
    final response =
        await http.get(Uri.parse("https://www.mp3quran.net/api/_arabic.json"));
    QuranModel data = QuranModel.fromJson(jsonDecode(response.body));
    try {
      if (response.statusCode == 200) {
        return Right(data); // Return an empty map if data is null
      } else {
        throw Exception('Failed to load Quran data');
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
