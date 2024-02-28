class LoginModelFail {
  String? status;
  Error? error;
  String? message;
  String? stack;

  LoginModelFail({this.status, this.error, this.message, this.stack});

  LoginModelFail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    message = json['message'];
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['message'] = this.message;
    data['stack'] = this.stack;
    return data;
  }
}

class Error {
  int? statusCode;
  String? status;
  bool? isOperational;

  Error({this.statusCode, this.status, this.isOperational});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    isOperational = json['isOperational'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['isOperational'] = this.isOperational;
    return data;
  }
}
