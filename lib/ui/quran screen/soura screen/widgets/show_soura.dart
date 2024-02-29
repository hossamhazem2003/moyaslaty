import 'package:flutter/material.dart';

import '../../quran_screen_vm.dart';

List<Widget> soura(SouraScreenVm souraScreenVm) {
    return List.generate(souraScreenVm.versus.length, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${souraScreenVm.versus[index].trim()} (${index + 1})",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "quran",
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      );
    });
  }