class QuranModel {
  List<QuranRecords>? reciters;

  QuranModel({this.reciters});

  QuranModel.fromJson(Map<String, dynamic> json) {
    if (json['reciters'] != null) {
      reciters = <QuranRecords>[];
      json['reciters'].forEach((v) {
        reciters!.add(QuranRecords.fromJson(v));
      });
    }
  }

}

class QuranRecords {
  String? id;
  String? name;
  String? server;
  String? rewaya;
  String? count;
  String? letter;
  String? suras;

  QuranRecords(
      {this.id,
      this.name,
      this.server,
      this.rewaya,
      this.count,
      this.letter,
      this.suras});

  QuranRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    server = json['Server'];
    rewaya = json['rewaya'];
    count = json['count'];
    letter = json['letter'];
    suras = json['suras'];
  }
}