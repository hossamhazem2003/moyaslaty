class InformationDM {
  String numOfPeople;
  String paied;
  double restOfAmount;
  bool isDone;

  InformationDM({
    required this.numOfPeople,
    required this.paied,
    required this.restOfAmount,
    required this.isDone,
  });

  // Method to toggle the isDone property
  void toggleDone() {
    isDone = !isDone;
  }
}

