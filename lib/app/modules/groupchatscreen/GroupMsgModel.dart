class GroupMsgModel {
  List<Body>? body;
  String? message;
  String? code;
  String? total;

  GroupMsgModel({this.body, this.message, this.code, this.total});

  GroupMsgModel.fromJson(Map<String, dynamic> json) {
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
  String? msgId;
  String? userId;
  String? userName;
  String? userMsg;
  String? timeStamp;
  String? updatedAt;

  Body(
      {this.msgId,
        this.userId,
        this.userName,
        this.userMsg,
        this.timeStamp,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    msgId = json['msgId'];
    userId = json['userId'];
    userName = json['userName'];
    userMsg = json['userMsg'];
    timeStamp = json['timeStamp'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msgId'] = this.msgId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userMsg'] = this.userMsg;
    data['timeStamp'] = this.timeStamp;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}