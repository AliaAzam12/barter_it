class User {
  String? id;
  String? email;
  String? name;
  String? password;
  String? phone;
  String? datereg;

  User(
      {this.id,
      this.email,
      this.name,
      this.password,
      this.phone,
      this.datereg});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    datereg = json['datereg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['datereg'] = this.datereg;
    return data;
  }
}