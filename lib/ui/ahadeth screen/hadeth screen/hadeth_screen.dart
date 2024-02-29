import 'package:flutter/material.dart';
import 'package:mwaslaty/core/sizes.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';
import 'package:provider/provider.dart';

import '../ahadeth_screen_vm.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({Key? key}) : super(key: key);
  static String routeName = "hadeth_screen";

  @override
  Widget build(BuildContext context) {
    final hadethScreenVm = Provider.of<AhadethScreenVm>(context);

    return SafeArea(
      child: Directionality(
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
            title: Text(
              hadethScreenVm.firstLine,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "font2",
              ),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              backGroungImage(context),
              Center(
                child: Container(
                  height: Sizes.height(context) * 0.75,
                  width: Sizes.width(context) * 0.85,
                  decoration: BoxDecoration(
                    color: const Color(0xff002661).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            hadethScreenVm.hadethWithoutFirstLine,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "font3",
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
