import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AhadethScreenVm extends ChangeNotifier {
  String hadethContent = "";
  String firstLine = "";
  String hadethWithoutFirstLine = "";

  Future<void> loadTextFile(String args) async {
    hadethContent = await rootBundle.loadString('assets/hadeth/h$args');
    List<String> lines = hadethContent.trim().split("\n");
    firstLine = lines.isNotEmpty ? lines[0] : "";
    lines.removeAt(0);
    hadethWithoutFirstLine = lines.join();
    notifyListeners();
  }
}
