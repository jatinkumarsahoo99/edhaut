class AllSubmitedTestWithResultModel {
  List<Body>? body;
  String? message;
  String? code;
  String? total;

  AllSubmitedTestWithResultModel(
      {this.body, this.message, this.code, this.total});

  AllSubmitedTestWithResultModel.fromJson(Map<String, dynamic> json) {
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
  String? answerSheetId;
  String? testName;
  String? testId;
  String? createdDate;
  String? topic;
  String? examDuration;
  String? tpotalMark;
  String? individualMark;
  String? className;
  String? classId;
  String? examDate;
  String? studentId;
  String? secureMark;
  List<Questions>? questions;

  Body(
      {this.answerSheetId,
        this.testName,
        this.testId,
        this.createdDate,
        this.topic,
        this.examDuration,
        this.tpotalMark,
        this.individualMark,
        this.className,
        this.classId,
        this.examDate,
        this.studentId,
        this.secureMark,
        this.questions});

  Body.fromJson(Map<String, dynamic> json) {
    answerSheetId = json['answerSheetId'];
    testName = json['testName'];
    testId = json['testId'];
    createdDate = json['createdDate'];
    topic = json['topic'];
    examDuration = json['examDuration'];
    tpotalMark = json['tpotalMark'];
    individualMark = json['individualMark'];
    className = json['className'];
    classId = json['classId'];
    examDate = json['examDate'];
    studentId = json['studentId'];
    secureMark = json['secureMark'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerSheetId'] = this.answerSheetId;
    data['testName'] = this.testName;
    data['testId'] = this.testId;
    data['createdDate'] = this.createdDate;
    data['topic'] = this.topic;
    data['examDuration'] = this.examDuration;
    data['tpotalMark'] = this.tpotalMark;
    data['individualMark'] = this.individualMark;
    data['className'] = this.className;
    data['classId'] = this.classId;
    data['examDate'] = this.examDate;
    data['studentId'] = this.studentId;
    data['secureMark'] = this.secureMark;
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
  String? correctChoice;
  String? selectedChoice;
  String? updatedAt;
  String? createdAt;

  Choices(
      {this.choiceId,
        this.choiceName,
        this.slNo,
        this.correctChoice,
        this.selectedChoice,
        this.updatedAt,
        this.createdAt});

  Choices.fromJson(Map<String, dynamic> json) {
    choiceId = json['choiceId'];
    choiceName = json['choiceName'];
    slNo = json['slNo'];
    correctChoice = json['correctChoice'];
    selectedChoice = json['selectedChoice'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choiceId'] = this.choiceId;
    data['choiceName'] = this.choiceName;
    data['slNo'] = this.slNo;
    data['correctChoice'] = this.correctChoice;
    data['selectedChoice'] = this.selectedChoice;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
