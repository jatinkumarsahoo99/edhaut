class ScheduledClassModel {
  List<Body>? body;
  String? message;
  String? code;
  String? total;

  ScheduledClassModel({this.body, this.message, this.code, this.total});

  ScheduledClassModel.fromJson(Map<String, dynamic> json) {
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
  String? classId;
  String? className;
  String? classUrl;
  String? teacherName;
  String? topic;
  String? classPlatform;
  String? classDate;
  String? classStartTime;
  String? classEndTime;
  String? updatedAt;
  String? createdAt;
  String? classTime;

  Body(
      {this.classId,
        this.className,
        this.classUrl,
        this.teacherName,
        this.topic,
        this.classPlatform,
        this.classDate,
        this.classStartTime,
        this.classEndTime,
        this.updatedAt,
        this.createdAt,
        this.classTime});

  Body.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    className = json['className'];
    classUrl = json['classUrl'];
    teacherName = json['teacherName'];
    topic = json['topic'];
    classPlatform = json['classPlatform'];
    classDate = json['classDate'];
    classStartTime = json['classStartTime']??"";
    classEndTime = json['classEndTime']??"";
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    classTime = json['classTime']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classId'] = this.classId;
    data['className'] = this.className;
    data['classUrl'] = this.classUrl;
    data['teacherName'] = this.teacherName;
    data['topic'] = this.topic;
    data['classPlatform'] = this.classPlatform;
    data['classDate'] = this.classDate;
    data['classStartTime'] = this.classStartTime;
    data['classEndTime'] = this.classEndTime;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['classTime'] = this.classTime;
    return data;
  }
}