import 'package:flutter/material.dart';

class BooksCategoryDM {
  Color background;
  String categoryName;
  String imagePaths;

  BooksCategoryDM(
      {required this.background,
      required this.categoryName,
      required this.imagePaths});
}

List<BooksCategoryDM> booksCategory = [
  BooksCategoryDM(
      background: Colors.green.withOpacity(0.5),
      categoryName: "كتب دينية",
      imagePaths: 'assets/images/adyan.jpeg'),
  BooksCategoryDM(
      background: Colors.red.withOpacity(0.5),
      categoryName: "قصص",
      imagePaths: 'assets/images/qss.jpg'),
  BooksCategoryDM(
      background: Colors.blueAccent.withOpacity(0.5),
      categoryName: "روايات",
      imagePaths: 'assets/images/rewayat.jpeg'),
  BooksCategoryDM(
      background: Colors.orange.withOpacity(0.5),
      categoryName: "اللغة العربية",
      imagePaths: 'assets/images/arabic.jpg'),
  BooksCategoryDM(
      background: Colors.purple.withOpacity(0.5),
      categoryName: "تطوير الذات",
      imagePaths: 'assets/images/that.jpg'),
  BooksCategoryDM(
      background: Colors.pink.withOpacity(0.5),
      categoryName: "أخري",
      imagePaths: 'assets/images/other.jpg')
];
