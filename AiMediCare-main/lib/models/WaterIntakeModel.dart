class WaterInTakeModel {
  WaterIntake? waterIntake;

  WaterInTakeModel({this.waterIntake});

  WaterInTakeModel.fromJson(Map<String, dynamic> json) {
    waterIntake = json['waterIntake'] != null
        ? new WaterIntake.fromJson(json['waterIntake'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.waterIntake != null) {
      data['waterIntake'] = this.waterIntake!.toJson();
    }
    return data;
  }
}

class WaterIntake {
  String? value;
  String? unit;
  String? description;

  WaterIntake({this.value, this.unit, this.description});

  WaterIntake.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    data['description'] = this.description;
    return data;
  }
}
