class BMImodel {
  String? bMI;
  String? weightStatus;
  String? messege;

  BMImodel({this.bMI, this.weightStatus, this.messege});

  BMImodel.fromJson(Map<String, dynamic> json) {
    bMI = json['BMI'];
    messege = json['message'];
    weightStatus = json['weightStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BMI'] = this.bMI;
    data['weightStatus'] = this.weightStatus;
    return data;
  }
}
