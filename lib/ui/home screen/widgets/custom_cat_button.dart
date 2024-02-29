import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

import '../../../core/sizes.dart';
import '../../../domain/model/home_screen_data_model.dart';
import '../../quran records screen/quran_records_screen.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

// ignore: must_be_immutable
class CustomCatButton extends StatelessWidget {
  int index;

  CustomCatButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (Catagories[index].screen != QuranRecordsScreen.routeName) {
          Navigator.pushNamed(context, Catagories[index].screen);
        } else {
          if (await ConnectivityWrapper.instance.isConnected) {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, QuranRecordsScreen.routeName);
          } else {
            // ignore: use_build_context_synchronously
            Dialogs.showAdaptiveDialogReuse(
                context, "Error", "No Internet Connection!");
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: Sizes.height(context) * 0.15,
        width: Sizes.width(context) * 0.90,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Catagories[index].firstColor,
              Catagories[index].secondColor
            ]),
            borderRadius: BorderRadius.circular(10),
            border: Border.all()),
        child: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  Catagories[index].path,
                ),
              ),
              const Spacer(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Catagories[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'font2'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Sizes.width(context) * 0.5,
                      child: Text(
                        Catagories[index].descrip,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'font3'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
