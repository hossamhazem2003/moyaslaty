import 'package:mwaslaty/domain/model/api%20models/quran_records_model.dart';
import 'package:dartz/dartz.dart';

import '../../model/faliure.dart';

abstract class QuranRecordsRepo {
  Future<Either<Failure, QuranModel>> fetchQuranData();
}
