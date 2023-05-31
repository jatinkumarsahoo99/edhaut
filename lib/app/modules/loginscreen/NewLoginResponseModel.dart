class NewLoginResponseModel {
  List<Body>? body;
  String? message;
  String? code;
  String? total;

  NewLoginResponseModel({this.body, this.message, this.code, this.total});

  NewLoginResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['total'] = this.total;
    return data;
  }
}

class Body {
  String? role;
  String? name;
  String? userId;
  String? email;

  Body({this.role, this.name, this.userId, this.email});

  Body.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    name = json['name'];
    userId = json['userId'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['email'] = this.email;
    return data;
  }
}