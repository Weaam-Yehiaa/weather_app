class WeatherModel{
  int? id;
  String? main,description,icon;

  WeatherModel(
  {
    this.id,
    this.main,
    this.description,
    this.icon
  });

  factory WeatherModel.fromJson(dynamic json) {

    if (json == null) {
      return WeatherModel();
    }

    return WeatherModel(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "main": this.main,
      "description": this.description,
      "icon": this.icon,
    };
  }

//
}