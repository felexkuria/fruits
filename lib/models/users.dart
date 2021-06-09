class User {
  int phoneNumber;
  String password;
  String userName;
  int id;
  User({
    required this.phoneNumber,
    required this.password,
    required this.userName,
    required this.id,
  });
  User.withId({
    required this.phoneNumber,
    required this.password,
    required this.id,
    required this.userName,
  });
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['username'] = userName;

    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User.withId(
      userName: map['username'],
      id: map['id'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }
}
