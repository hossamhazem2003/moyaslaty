import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/books%20screen/books_screen_vm.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

import '../../domain/model/stories_model.dart';
import 'widgets/pdf_viewr.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments as String;
    List<Book> booksList = BoocsScreenVM().categoryNewList(args);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
          backgroundColor: Colors.blue,
            title: Text(args,
            style: const TextStyle(fontFamily: 'font1', fontSize: 15,color: Colors.white),
            ),
          ),
          body: Stack(
            children: [
              backGroungImage(context),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  crossAxisSpacing: 8.0, // spacing between columns
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 2.5,
                ),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: booksList.length, // total number of items
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewr(assetPath: booksList[index].storyPath),
                            settings: RouteSettings(arguments: booksList[index].name)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          booksList[index].coverPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}