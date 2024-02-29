import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/ogra%20screen/ogra_view_model.dart';

import '../../../core/sizes.dart';

// ignore: must_be_immutable
class OperationContainer extends StatelessWidget {
  OgraViewModel ograViewModel;
  OperationContainer({super.key, required this.ograViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) * 0.20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: Sizes.width(context) * 0.40,
                child: TextFormField(
                  controller: ograViewModel.numOfPeoples,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'عدد الأفراد',
                    labelStyle: TextStyle(fontSize: 15,fontFamily: 'font3',color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: Sizes.width(context) * 0.40,
                child: TextFormField(
                  controller: ograViewModel.paied,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'المدفوع',
                    labelStyle: TextStyle(fontSize: 15,fontFamily: 'font3',color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    ograViewModel.addInfoList();
                  },
                  child: const Text('تم',
                  style: TextStyle(fontFamily: 'font3'),
                  ),
                  ),
              const Spacer(),
              ElevatedButton(
                  onPressed: ograViewModel.clearTextField,
                  child: const Text('اضافة',
                  style: TextStyle(fontFamily: 'font3'),
                  )),
              const Spacer(),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
