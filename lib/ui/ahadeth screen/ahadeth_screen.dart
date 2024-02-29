import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

import 'hadeth screen/hadeth_screen.dart';
import 'ahadeth_screen_vm.dart';
import 'package:provider/provider.dart';

class AhadethScreen extends StatelessWidget {
  const AhadethScreen({super.key});
  static const String routeName = "a_s";

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
              'أحاديث شريفة',
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
                    flex: 6,
                    child: Column(
                      children: [
                        Container(height: 3, color: Colors.white),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'الأحاديث',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "font3"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 3,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  var hadethScreenVm = Provider.of<AhadethScreenVm>(
                                      context,
                                      listen: false);
                                  hadethScreenVm.loadTextFile("${index + 1}.txt");
              
                                  Navigator.of(context).pushNamed(
                                    HadethScreen.routeName,
                                    arguments: "${index + 1}.txt",
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        " الحديث رقم  ${index + 1}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "font3"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
