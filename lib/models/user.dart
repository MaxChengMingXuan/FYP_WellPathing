class User {
  String? id;
  String? name;
  String? email;
  String? role;
  String? matric;
  String? staffid;
  String? school;
  String? programme;
  String? department;
  String? regdate;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.matric,
      required this.staffid,
      required this.school,
      required this.programme,
      required this.department,
      required this.regdate});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    matric = json['matric'];
    staffid = json['staffid'];
    school = json['school'];
    programme = json['programme'];
    department = json['department'];

    regdate = json['regdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['matric'] = matric;
    data['staffid'] = staffid;
    data['school'] = school;
    data['programme'] = programme;
    data['department'] = department;
    data['regdate'] = regdate;
    return data;
  }
}
