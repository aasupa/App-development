class SignUpBody {
  String name;
  String phone;
  String email;
  String password;
  String address;
  SignUpBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;
    data["address"] = this.address;
    return data;
  }
}
