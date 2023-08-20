class UserLoginReq {
  String? username;
  String? password;

  UserLoginReq({this.username, this.password});

  factory UserLoginReq.fromJson(Map<String, dynamic> json) {
    return UserLoginReq(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
