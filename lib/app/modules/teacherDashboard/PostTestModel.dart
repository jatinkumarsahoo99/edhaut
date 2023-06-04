class PostTestModel {
  String? testName;
  String? correctChoice;
  String? examDate;
  String? createdDate;
  String? topic;
  String? examDuration;
  String? tpotalMark;
  String? individualMark;
  String? className;
  String? classId;
  String? totalQuestion;
  List<Questions>? questions;

  PostTestModel(
      {this.testName,
        this.correctChoice,
        this.examDate,
        this.createdDate,
        this.topic,
        this.examDuration,
        this.tpotalMark,
        this.individualMark,
        this.className,
        this.classId,
        this.totalQuestion,
        this.questions});

  PostTestModel.fromJson(Map<String, dynamic> json) {
    testName = json['testName'];
    correctChoice = json['correctChoice'];
    examDate = json['examDate'];
    createdDate = json['createdDate'];
    topic = json['topic'];
    examDuration = json['examDuration'];
    tpotalMark = json['tpotalMark'];
    individualMark = json['individualMark'];
    className = json['className'];
    classId = json['classId'];
    totalQuestion = json['totalQuestion'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['testName'] = this.testName;
    data['correctChoice'] = this.correctChoice;
    data['examDate'] = this.examDate;
    data['createdDate'] = this.createdDate;
    data['topic'] = this.topic;
    data['examDuration'] = this.examDuration;
    data['tpotalMark'] = this.tpotalMark;
    data['individualMark'] = this.individualMark;
    data['className'] = this.className;
    data['classId'] = this.classId;
    data['totalQuestion'] = this.totalQuestion;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionText;
  String? slNo;
  String? correctChoiceNo;
  List<Choices>? choices;

  Questions({this.questionText, this.slNo, this.choices});

  Questions.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    slNo = json['slNo'];
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
    data['questionText'] = this.questionText;
    data['slNo'] = this.slNo;
    data['correctChoiceNo'] = this.correctChoiceNo;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  String? choiceText;
  String? slNo;
  bool? correct;

  Choices({this.choiceText, this.correct,this.slNo});

  Choices.fromJson(Map<String, dynamic> json) {
    choiceText = json['choiceText'];
    correct = json['correct']??"";
    slNo = json['slNo']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choiceText'] = this.choiceText;
    data['correct'] = this.correct??"";
    data['slNo'] = this.slNo??"";
    return data;
  }
}