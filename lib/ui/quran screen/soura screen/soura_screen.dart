import 'package:flutter/material.dart';
import 'package:mwaslaty/core/sizes.dart';

import '../quran_screen_vm.dart';
import 'package:provider/provider.dart';

import 'widgets/show_soura.dart';

class SouraScreen extends StatelessWidget {
  static const String routeName = 's_s';

  const SouraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final souraScreenVm = Provider.of<SouraScreenVm>(context);

    if (souraScreenVm.versus.isEmpty) {
      souraScreenVm.loadTextFile(args["soura_details"]);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: const Color(0xff346d71),
          title: Text(
            "سورة ${args["soura_name"]}",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "quran",
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/frame.png",
              height: Sizes.height(context),
              width: Sizes.width(context),
              fit: BoxFit.fill,
            ),
            souraScreenVm.versus.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.all(65),
                    height: Sizes.height(context),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          args["soura_name"] == 'التوبة'
                              ? const Text("")
                              : const Text(
                                  "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: "quran",
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                          const SizedBox(
                            height: 5,
                          ),
                          souraScreenVm.versus.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  children: soura(souraScreenVm),
                                ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
