class ApiFactory {
  static String BASEURL="http://192.168.0.162:5002";
  static String BASEURL2="http://192.168.0.162:3000";
  static String SIGNUP =BASEURL+ "/api/create-teacher";
  static String STUDENT_SIGNUP = BASEURL + "/api/create-student";
  static String LOGIN =BASEURL+ "/api/new-login?email=";
  static String GROUPCHAT_GETALLMSG =BASEURL+ "/api/get-All-msg";
  static String GROUPCHAT_POSTALLMSG =BASEURL+ "/api/post-group-msg";
  static String QUESTION_CREATED =BASEURL+ "/api/question-created";
  static String GETALLSCHEDULEDCLASSES1 =BASEURL+ "/api/get-allClasses?date=";
  static String SCHEDULEDCLASS =BASEURL+ "/api/create-scheduled-classes";
  static String GETALLTEST =BASEURL+ "/api/get-AllTest";
  static String GETALLCLASSESDROP =BASEURL+ "/api/get-All-classes";



}