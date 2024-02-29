import 'package:flutter/material.dart';
import 'package:mwaslaty/core/sizes.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/quran_records_vm.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/souras_records_screen.dart';
import 'package:provider/provider.dart';


class QuranRecordsScreen extends StatelessWidget {
  const QuranRecordsScreen({Key? key}) : super(key: key);
  static const String routeName = 'q_r_s';

  @override
  Widget build(BuildContext context) {
    final quranScreenVM = Provider.of<BodcastScreenVM>(context, listen: false);
    quranScreenVM.fetchQuranRecords(); // Call this to fetch data

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "التسجيلات الصوتية",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "font2"),
          ),
          centerTitle: true,
        ),
        body: Consumer<BodcastScreenVM>(
          builder: (context, state, _) {
            if (state.isUploading == true) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.brown,
              ));
            } else if (state.isError == true) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  title: const Text("خطأ"),
                  content: Text(state.errorMessage),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('تم'),
                    ),
                  ],
                ),
              );
            } else {
              final records = state.quranRec;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SouraRecScreen.routeName,
                          arguments: {
                            'suras': records[index].suras,
                            'server': records[index].server ?? "null"
                          });
                    },
                    child: Container(
                      height: Sizes.height(context) * 0.11,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'الشيخ ${records[index].name}',
                                style: const TextStyle(
                                    fontSize: 25, fontFamily: 'soura',overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'رواية ${records[index].rewaya}',
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'quran',overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Container(
                            width: 3,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: records.length,
              );
            }
          },
        ),
      ),
    );
  }
}
