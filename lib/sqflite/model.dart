class Model {
  int? id;
  int? userid;
  int height;
  int weight;
  String username;
  String fname;
  String mname;
  String lname;
  String dob;
  String email;
  String gender;
  String hunit;
  String wunit;
  String precon;
  String phyact;
  String desc;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String image6;
  String image7;
  String image8;
  String image9;
  String image10;
  String vid1;
  String vid2;

  Model({
    this.id,
    required this.userid,
    required this.username,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.dob,
    required this.email,
    required this.gender,
    required this.hunit,
    required this.wunit,
    required this.height,
    required this.weight,
    required this.precon,
    required this.phyact,
    required this.desc,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.image8,
    required this.image9,
    required this.image10,
    required this.vid1,
    required this.vid2,
  });

  Model copy({
    int? userid,
    int? height,
    int? weight,
    String? username,
    String? fname,
    String? mname,
    String? lname,
    String? dob,
    String? email,
    String? gender,
    String? hunit,
    String? wunit,
    String? precon,
    String? phyact,
    String? desc,
    String? image1,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    String? image6,
    String? image7,
    String? image8,
    String? image9,
    String? image10,
    String? vid1,
    String? vid2,
  }) =>
      Model(
        id: id ?? this.id,
        userid: userid ?? this.userid,
        username: username ?? this.username,
        fname: fname ?? this.fname,
        mname: mname ?? this.mname,
        lname: lname ?? this.lname,
        dob: dob ?? this.dob,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        hunit: hunit ?? this.hunit,
        wunit: wunit ?? this.wunit,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        precon: precon ?? this.precon,
        phyact: phyact ?? this.phyact,
        desc: desc ?? this.desc,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2,
        image3: image3 ?? this.image3,
        image4: image4 ?? this.image4,
        image5: image5 ?? this.image5,
        image6: image6 ?? this.image6,
        image7: image7 ?? this.image7,
        image8: image8 ?? this.image8,
        image9: image9 ?? this.image9,
        image10: image10 ?? this.image10,
        vid1: vid1 ?? this.vid1,
        vid2: vid2 ?? this.vid2,
      );

  Model fromJson(json) {
    return Model(
      id: json['id'],
      userid: json['userid'],
      username: json['username'],
      fname: json['fname'],
      mname: json['mname'],
      lname: json['lname'],
      dob: json['dob'],
      email: json['email'],
      gender: json['gender'],
      hunit: json['hunit'],
      wunit: json['wunit'],
      height: json['height'],
      weight: json['weight'],
      precon: json['precon'],
      phyact: json['phyact'],
      desc: json['desc'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      image5: json['image5'],
      image6: json['image6'],
      image7: json['image7'],
      image8: json['image8'],
      image9: json['image9'],
      image10: json['image10'],
      vid1: json['vid1'],
      vid2: json['vid2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'username': username,
      'fname': fname,
      'mname': mname,
      'lname': lname,
      'dob': dob,
      'email': email,
      'gender': gender,
      'hunit': hunit,
      'wunit': wunit,
      'height': height,
      'weight': weight,
      'precon': precon,
      'phyact': phyact,
      'desc': desc,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image6': image6,
      'image7': image7,
      'image8': image8,
      'image9': image9,
      'image10': image10,
      'vid1': vid1,
      'vid2': vid2,
    };
  }
}
