class LoginResponseModel {
  Body? body;
  String? message;
  String? code;
  String? total;

  LoginResponseModel({this.body, this.message, this.code, this.total});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    message = json['message'];
    code = json['code'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['total'] = this.total;
    return data;
  }
}

class Body {
  String? studentId;
  String? studentName;
  String? email;
  String? userRole;
  String? password;

  Body(
      {this.studentId,
        this.studentName,
        this.email,
        this.userRole,
        this.password});

  Body.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    email = json['email'];
    userRole = json['userRole'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['email'] = this.email;
    data['userRole'] = this.userRole;
    data['password'] = this.password;
    return data;
  }
}