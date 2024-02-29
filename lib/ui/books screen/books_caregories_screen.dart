import 'package:flutter/material.dart';
import 'package:mwaslaty/core/sizes.dart';
import 'package:mwaslaty/domain/model/books_caregory_model.dart';
import 'package:mwaslaty/ui/books%20screen/books_screen.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

class BooksCategoriesScreen extends StatelessWidget {
  const BooksCategoriesScreen({super.key});
  static const String routeName = 'b_s';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
          backgroundColor: Colors.blue,
          title: const Text(
            "الكتب",
            style: TextStyle(fontFamily: 'font1', fontSize: 15,color: Colors.white),
          ),
          centerTitle: true,
        ),
          body: Stack(
            children: [
              backGroungImage(context),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  crossAxisSpacing: 8.0, // spacing between columns
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: booksCategory.length, // total number of items
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BooksScreen(),
                            settings: RouteSettings(arguments: booksCategory[index].categoryName)),
                      );
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: booksCategory[index].background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: Sizes.height(context) * 0.20,
                            
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(booksCategory[index].imagePaths,
                            height: Sizes.height(context) * 0.27,
                            width: Sizes.width(context) * 0.35,
                            fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: Sizes.height(context) * 0.27,
                            width: Sizes.width(context) * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()
                            ),
                            child: Center(
                              child: Text(booksCategory[index].categoryName,
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'font3'
                              ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
    ));
  }
}

