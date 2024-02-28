import 'dart:convert';

LoginModelSuccsess usersFromJson(String str) =>
    LoginModelSuccsess.fromJson(json.decode(str));

class LoginModelSuccsess {
  String? status;
  String? token;
  Data? data;
  String? message;

  LoginModelSuccsess({this.status, this.token, this.data, this.message});

  LoginModelSuccsess.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? role;
  bool? active;
  String? sId;
  int? iV;

  User({this.name, this.email, this.role, this.active, this.sId, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    active = json['active'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['active'] = active;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}


// class LoginModelSuccsess {
//   String? status;
//   String? token;
//   Data? data;

//   LoginModelSuccsess({this.status, this.token, this.data});

//   LoginModelSuccsess.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     token = json['token'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['token'] = this.token;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   User? user;

//   Data({this.user});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   String? sId;
//   String? name;
//   String? email;
//   String? role;
//   int? iV;

//   User({this.sId, this.name, this.email, this.role, this.iV});

//   User.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     email = json['email'];
//     role = json['role'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['role'] = this.role;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
