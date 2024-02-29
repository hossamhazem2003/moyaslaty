import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/ogra%20screen/ogra_view_model.dart';
import 'package:mwaslaty/ui/ogra%20screen/widgets/operations_container.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/information_list.dart';

class OgraScreen extends StatelessWidget {
  const OgraScreen({super.key});
  static const String routeName = "o_s";

  @override
  Widget build(BuildContext context) {
    OgraViewModel ograViewModel = Provider.of<OgraViewModel>(context);

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
            'لم الأجرة',
            style: TextStyle(
                fontFamily: 'font1', fontSize: 15, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            backGroungImage(context),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ograViewModel.mainOgra,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'أجرة الفرد الواحد كام',
                      labelStyle: TextStyle(fontSize: 16,color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                OperationContainer(ograViewModel: ograViewModel),
                const SizedBox(
                  height: 10,
                ),
                InformationsList(ograViewModel: ograViewModel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
