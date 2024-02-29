import 'package:flutter/material.dart';
import 'package:mwaslaty/domain/model/information_model.dart';

class OgraViewModel extends ChangeNotifier {
  TextEditingController mainOgra = TextEditingController();
  TextEditingController numOfPeoples = TextEditingController();
  TextEditingController paied = TextEditingController();
  double restOfAmount = 0.0;
  List<InformationDM> infoList = [];
  bool isDone = false;

  void toggleInfoList(int index) {
    infoList[index].toggleDone();
    notifyListeners();
  }

  double hesabRestOfAmount() {
    double mainOgraValue = double.tryParse(mainOgra.text) ?? 0.0; //10
    double numOfPeoplesValue = double.tryParse(numOfPeoples.text) ?? 0.0; //5
    double paiedValue = double.tryParse(paied.text) ?? 0.0; //60
    double paidPerPerson = mainOgraValue * numOfPeoplesValue; //50
    if (paidPerPerson < paiedValue) {
      restOfAmount = paiedValue - paidPerPerson;
      notifyListeners();
    } else {
      restOfAmount = 0.0;
    }
    notifyListeners();

    return restOfAmount;
  }

  void clearTextField() {
    numOfPeoples.clear();
    paied.clear();
    notifyListeners();
  }

  void addInfoList() {
    infoList.add(InformationDM(
        numOfPeople: numOfPeoples.text,
        paied: paied.text,
        restOfAmount: hesabRestOfAmount(),
        isDone: isDone,));
    notifyListeners();
  }

  void removeFromInfoList(index) {
    infoList.removeAt(index);
    notifyListeners();
  }
}
