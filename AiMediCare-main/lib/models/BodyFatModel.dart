class BodyFatModel {
  BodyFatPercentage? bodyFatPercentage;

  BodyFatModel({this.bodyFatPercentage});

  BodyFatModel.fromJson(Map<String, dynamic> json) {
    bodyFatPercentage = json['bodyFatPercentage'] != null
        ? new BodyFatPercentage.fromJson(json['bodyFatPercentage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bodyFatPercentage != null) {
      data['bodyFatPercentage'] = this.bodyFatPercentage!.toJson();
    }
    return data;
  }
}

class BodyFatPercentage {
  String? value;
  String? description;

  BodyFatPercentage({this.value, this.description});

  BodyFatPercentage.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['description'] = this.description;
    return data;
  }
}
