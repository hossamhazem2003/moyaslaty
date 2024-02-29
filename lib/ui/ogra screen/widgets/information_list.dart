import 'package:flutter/material.dart';

import '../ogra_view_model.dart';

class InformationsList extends StatelessWidget {
  const InformationsList({
    super.key,
    required this.ograViewModel,
  });

  final OgraViewModel ograViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        Text(
                          "${ograViewModel.infoList[index].numOfPeople} من ال ${ograViewModel.infoList[index].paied} جنيه",
                          style: const TextStyle(fontFamily: 'font3'),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'والباقي ${ograViewModel.infoList[index].restOfAmount} جنيه',
                          style: const TextStyle(fontFamily: 'font3'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Text(
                          'خد الباقي؟',
                          style: TextStyle(fontFamily: 'font3'),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            ograViewModel.toggleInfoList(index);
                          },
                          child: Container(
                            width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: ograViewModel.infoList[index].isDone
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                    )
                                  : const Text(""),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                Visibility(
                  visible: ograViewModel.infoList[index].isDone,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'مافيش باقي كدة',
                      style: TextStyle(fontFamily: 'font3'),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ograViewModel.removeFromInfoList(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          );
        },
        itemCount: ograViewModel.infoList.length,
      ),
    );
  }
}
