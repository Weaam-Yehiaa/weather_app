class FiveDaysModel{
  int? temp;
  String? dateTime;

  FiveDaysModel({
    this.temp,
    this.dateTime
});

  factory FiveDaysModel.fromJson(dynamic json) {
    if (json == null) {
      return FiveDaysModel();
    }

    var date = json['dt_txt'].substring(5,10);

    return FiveDaysModel(
      dateTime: '$date',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "dateTime": this.dateTime,
    };
  }
}