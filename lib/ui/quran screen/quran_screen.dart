import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/quran%20screen/soura%20screen/soura_screen.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

import '../../domain/model/quran_info.dart';
import 'quran_screen_vm.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  static const String routeName = "q_s";

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
              'القرءان الكريم',
              style: TextStyle(fontFamily: 'font2', fontSize: 15,color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              backGroungImage(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: double.infinity,
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(6.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'اسم السورة',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "font3",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'عدد الآيات',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "font3",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(height: 3, color: Colors.white),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 5),
                                itemCount: QuranInfo.souraName.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      var souraScreenVm =
                                        Provider.of<SouraScreenVm>(context, listen: false);
                                    souraScreenVm.loadTextFile("${index + 1}.txt");
              
                                    Navigator.of(context).pushNamed(
                                      SouraScreen.routeName,
                                      arguments: {
                                        "soura_name": QuranInfo.souraName[index],
                                        "soura_details": "${index + 1}.txt",
                                      },
                                    );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              QuranInfo.souraName[index],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontFamily: "quran"),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              QuranInfo.numberOfVerses[index],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontFamily: "font3"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
