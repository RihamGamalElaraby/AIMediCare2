class BmrModel {
  Bmr? bmr;
  Tdee? tdee;

  BmrModel({this.bmr, this.tdee});

  BmrModel.fromJson(Map<String, dynamic> json) {
    bmr = json['bmr'] != null ? new Bmr.fromJson(json['bmr']) : null;
    tdee = json['tdee'] != null ? new Tdee.fromJson(json['tdee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bmr != null) {
      data['bmr'] = this.bmr!.toJson();
    }
    if (this.tdee != null) {
      data['tdee'] = this.tdee!.toJson();
    }
    return data;
  }
}

class Bmr {
  int? value;
  String? description;

  Bmr({this.value, this.description});

  Bmr.fromJson(Map<String, dynamic> json) {
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

class Tdee {
  double? value;
  String? description;

  Tdee({this.value, this.description});

  Tdee.fromJson(Map<String, dynamic> json) {
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
