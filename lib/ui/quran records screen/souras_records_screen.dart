import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'quran_records_vm.dart';

class SouraRecScreen extends StatelessWidget {
  const SouraRecScreen({super.key});
  static const String routeName = "sr_s";

  @override
  Widget build(BuildContext context) {
    final quranScreenVM = Provider.of<BodcastScreenVM>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    List suras = quranScreenVM.getSouranum(args['suras']!);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('السور',
          style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "font2"),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(),
              borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5,),
                  const Icon(Icons.record_voice_over_rounded),
                  const SizedBox(width: 10,),
                  Text(
                    quranScreenVM.getSurahName(int.parse(suras[index])),
                    style: const TextStyle(fontSize: 20,
                    fontFamily: 'quran'
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        quranScreenVM.playAudio(quranScreenVM
                            .generateAudioUrl(args['server'],int.parse(suras[index])));
                      },
                      child: const Text('تشغيل',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      ),
                      )),
                  TextButton(
                      onPressed: () {
                        quranScreenVM.stopAudio();
                      },
                      child: const Text('ايقاف',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),
                      ))
                ],
              ),
            );
          },
          itemCount: suras.length,
        ),
      ),
    );
  }
}