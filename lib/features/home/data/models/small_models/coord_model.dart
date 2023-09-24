class CoordModel {
  final double? lon, lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.fromJson(json) {
    if (json == null) {
      return CoordModel();
    }
    return CoordModel(lon:json['lon'], lat : json['lat']);
  }

  Map<String, dynamic> ToMap() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}
