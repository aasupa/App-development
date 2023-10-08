class UserModel {
  int id;
  String f_name;
  String email;
  String phone;
  String address;
  String password;
  // String order_Count;

  UserModel(
      {required this.id,
      required this.f_name,
      required this.email,
      required this.phone,
      required this.address,
      required this.password
      //required this.order_Count,
      });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      f_name: json['f_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      password: json['password'] ?? '',

      //order_Count: json['order_Count']
    );
  }
}
