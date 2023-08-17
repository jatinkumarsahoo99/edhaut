class ResultData{
   String? subjectName;
   int? totalMarks;
   int? obtainedMarks;
   String? grade;
   ResultData({this.grade,this.obtainedMarks,this.subjectName,this.totalMarks});
}

List<ResultData> result =[
  ResultData(
    grade: "A",
    obtainedMarks: 98,
    subjectName: "Math",
    totalMarks: 100
  ),
  ResultData(
      grade: "A",
      obtainedMarks: 98,
      subjectName: "English",
      totalMarks: 100
  )
  ,
  ResultData(
      grade: "A",
      obtainedMarks: 98,
      subjectName: "English",
      totalMarks: 100
  ),
  ResultData(
      grade: "D",
      obtainedMarks: 35,
      subjectName: "English",
      totalMarks: 100
  )
];