class UserModel {
  int id;
  String f_name;
  String email;
  String phone;
  int? order_Count;

  UserModel({
    required this.id,
    required this.f_name,
    required this.email,
    required this.phone,
    required this.order_Count,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        f_name: json['f_name'],
        email: json['email'],
        phone: json['phone'],
        order_Count: json['order_Count']);
  }
}
