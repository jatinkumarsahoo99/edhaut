class GetAllTestModel {
  List<Body>? body;
  String? message;
  String? code;
  String? total;

  GetAllTestModel({this.body, this.message, this.code, this.total});

  GetAllTestModel.fromJson(Map<String, dynamic> json) {
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
  String? examId;
  String? examName;
  String? correctChoice;
  String? examDate;
  String? totalQuestion;
  String? createdDate;
  String? topic;
  String? examDuration;
  String? tpotalMark;
  String? individualMark;
  String? className;
  String? classId;
  List<Questions>? questions;

  Body(
      {this.examId,
        this.examName,
        this.correctChoice,
        this.examDate,
        this.totalQuestion,
        this.createdDate,
        this.topic,
        this.examDuration,
        this.tpotalMark,
        this.individualMark,
        this.className,
        this.classId,
        this.questions});

  Body.fromJson(Map<String, dynamic> json) {
    examId = json['examId'];
    examName = json['examName'];
    correctChoice = json['correctChoice'];
    examDate = json['examDate'];
    totalQuestion = json['totalQuestion'];
    createdDate = json['createdDate'];
    topic = json['topic'];
    examDuration = json['examDuration'];
    tpotalMark = json['tpotalMark'];
    individualMark = json['individualMark'];
    className = json['className'];
    classId = json['classId'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examId'] = this.examId;
    data['examName'] = this.examName;
    data['correctChoice'] = this.correctChoice;
    data['examDate'] = this.examDate;
    data['totalQuestion'] = this.totalQuestion;
    data['createdDate'] = this.createdDate;
    data['topic'] = this.topic;
    data['examDuration'] = this.examDuration;
    data['tpotalMark'] = this.tpotalMark;
    data['individualMark'] = this.individualMark;
    data['className'] = this.className;
    data['classId'] = this.classId;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionName;
  String? questionId;
  String? serialNo;
  String? correctChoiceNo;
  List<Choices>? choices;

  Questions(
      {this.questionName,
        this.questionId,
        this.serialNo,
        this.correctChoiceNo,
        this.choices});

  Questions.fromJson(Map<String, dynamic> json) {
    questionName = json['questionName'];
    questionId = json['questionId'];
    serialNo = json['serialNo'];
    correctChoiceNo = json['correctChoiceNo'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionName'] = this.questionName;
    data['questionId'] = this.questionId;
    data['serialNo'] = this.serialNo;
    data['correctChoiceNo'] = this.correctChoiceNo;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  String? choiceId;
  String? choiceName;
  String? slNo;
  String? createdAt;
  String? updatedAt;
  bool ? isSelected = false;

  Choices(
      {this.choiceId,
        this.choiceName,
        this.slNo,
        this.createdAt,
        this.updatedAt,this.isSelected});

  Choices.fromJson(Map<String, dynamic> json) {
    choiceId = json['choiceId'];
    choiceName = json['choiceName'];
    slNo = json['slNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isSelected = json['isSelected']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choiceId'] = this.choiceId;
    data['choiceName'] = this.choiceName;
    data['slNo'] = this.slNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isSelected'] = this.isSelected??false;
    return data;
  }
}