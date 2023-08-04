// Userinfo
// firstname
// middlename
// lastname
// age
// email
// gender

class UserinfoStaging {
  final String firstname;
  final String middlename;
  final String lastname;
  final String email;
  final int age;
  final String gender;

  const UserinfoStaging({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.email,
    required this.age,
    required this.gender,
  });

  factory UserinfoStaging.fromJson(Map<String, dynamic> json) {
    return UserinfoStaging(
      firstname: json['firstname'].toString(),
      middlename: json['middlename'].toString(),
      lastname: json['lastname'].toString(),
      email: json['email'].toString(),
      age: json['age'],
      gender: json['gender'].toString(),
    );
  }
}
