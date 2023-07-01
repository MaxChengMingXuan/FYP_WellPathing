class Result {
  String? resultid;
  String? id;
  String? sskmscore;
  String? sskmlevel;
  String? sskmsentiasa;
  String? resultdate;

  Result({
    required this.resultid,
    required this.id,
    required this.sskmscore,
    required this.sskmlevel,
    required this.sskmsentiasa,
    required this.resultdate,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resultid: json['result_id'],
      id: json['id'],
      sskmscore: json['sskm_score'],
      sskmlevel: json['sskm_level'],
      sskmsentiasa: json['sskm_sentiasa'],
      resultdate: json['result_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result_id': resultid,
      'id': id,
      'sskm_score': sskmscore,
      'sskm_level': sskmlevel,
      'sskm_sentiasa': sskmsentiasa,
      'result_date': resultdate,
    };
  }
}
