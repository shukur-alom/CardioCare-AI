class PredictionAns {
  String? ans;
  String? index;

  PredictionAns({this.ans, this.index});

  PredictionAns.fromJson(Map<String, dynamic> json) {
    ans = json['ans'];
    index = json['index'];
  }
}
