class SysModel{
  int? type,id,sunrise,sunset;
  String? country;

  SysModel({
    this.type,
    this.id,
    this.sunrise,
    this.sunset,
    this.country
});

  factory SysModel.fromJson(dynamic json) {
    if (json == null) {
      return SysModel();
    }
    return SysModel(
      type: json["type"],
      id: json["id"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": this.type,
      "id": this.id,
      "sunrise": this.sunrise,
      "sunset": this.sunset,
      "country": this.country,
    };
  }
}