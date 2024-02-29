import 'package:flutter/material.dart';
import 'package:mwaslaty/domain/model/home_screen_data_model.dart';
import 'package:mwaslaty/ui/home%20screen/widgets/custom_cat_button.dart';
import 'package:mwaslaty/ui/utilitz_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "h_s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/logo.jpg',
            )),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "مواصلاتي",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "font2",color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          backGroungImage(context),
          ListView.builder(
            itemBuilder: (context, index) {
              return CustomCatButton(index: index);
            },
            itemCount: Catagories.length,
          ),
        ],
      ),
    );
  }
}
