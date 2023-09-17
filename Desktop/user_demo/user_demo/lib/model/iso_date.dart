class IsoDate {
  String? date;

  IsoDate({this.date});

  IsoDate.fromJson(Map<String, dynamic> json) {
    date = json['\$date'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['\$date'] = date;

    return data;
  }
}
