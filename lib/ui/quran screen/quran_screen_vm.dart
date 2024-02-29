import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SouraScreenVm extends ChangeNotifier {
  String souraContent = "";
  List<String> versus = [];

  Future<void> loadTextFile(String txt) async {
    souraContent = await rootBundle.loadString('assets/soura_quran/$txt');
    List<String> lines = souraContent.trim().split('\n');
    versus = lines;
    notifyListeners();
  }
}
