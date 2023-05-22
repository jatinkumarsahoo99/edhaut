class SignupModel {
  String? studentName;
  String? email;
  String? password;

  SignupModel({this.studentName, this.email, this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentName'] = this.studentName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}