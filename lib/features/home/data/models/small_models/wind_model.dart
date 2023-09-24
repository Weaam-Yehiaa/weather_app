class WindModel{
  double? speed;
  int? deg;

  WindModel({
    this.speed,
    this.deg
    });

  factory WindModel.fromJson(dynamic json) {
    if (json == null) {
      return WindModel();
    }
    return WindModel(
      speed: double.parse(json['speed'].toString()),
      deg: json["deg"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "speed": this.speed,
      "deg": this.deg,
    };
  }

}