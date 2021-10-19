class Question {
  String? savol;
  List? javoblar;
  int? javob;

  Question.fromJson(Map<dynamic, dynamic> json) {
    savol = json["savol"];
    javoblar = json["javoblar"];
    javob = json["javob"];
  }
}
