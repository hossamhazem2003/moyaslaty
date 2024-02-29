import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/ahadeth%20screen/ahadeth_screen.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/quran_records_screen.dart';
import 'package:mwaslaty/ui/ogra%20screen/ogra_screen.dart';
import 'package:mwaslaty/ui/quran%20screen/quran_screen.dart';
import 'package:mwaslaty/ui/books%20screen/books_caregories_screen.dart';

class Category {
  String name;
  Color firstColor;
  Color secondColor;
  String screen;
  String path;
  String descrip;
  Category(
      {required this.name,
      required this.firstColor,
      required this.secondColor,
      required this.screen,
      required this.path,
      required this.descrip});
}

// ignore: non_constant_identifier_names
List<Category> Catagories = [
  Category(
      name: "لم الأجرة",
      firstColor: const Color(0xff62cff4),
      secondColor: const Color(0xff2c67f2),
      screen: OgraScreen.routeName,
      path: 'assets/images/ogra.jpeg',
      descrip: 'لو كنت خايف تتلخبط ونت بتلم الأجرة دوس هنا'),
  Category(
      name: "اقرا قرءان",
      firstColor: const Color(0xff004ff9),
      secondColor: const Color(0xff000000),
      screen: QuranScreen.routeName,
      path: 'assets/images/quran.jpeg',
      descrip: 'استغل وقتك خير استغلال في قراءة كتاب الله'),
  Category(
      name: "اسمع قرءان",
      firstColor: const Color(0xff86e7d6),
      secondColor: const Color(0xff538ad6),
      screen: QuranRecordsScreen.routeName,
      path: 'assets/images/quraa.jpeg',
      descrip: 'استمع للقرءان الكريم اونلاين لجميع القراء و بجميع القراءات'),
  Category(
      name: "اقرا احاديث",
      firstColor: const Color(0xff92ffc0),
      secondColor: const Color(0xff002661),
      screen: AhadethScreen.routeName,
      path: 'assets/images/ahadeth.png',
      descrip: 'اعرف أكتر عن سنة الرسول بقراءة بعض الاحاديث الصحيحة'),
  Category(
      name: "اقرا كتب",
      firstColor: const Color(0xff711606).withOpacity(0.2),
      secondColor: const Color(0xff711606),
      screen: BooksCategoriesScreen.routeName,
      path: 'assets/images/kotob.png',
      descrip: 'سلي وقتك وثقف نفسك بقراءة كتب من كذا نوع')
];
 // const Color(0xff538ad6)