import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.uid,
    super.firstName,
    super.lastName,
    super.phone,
    super.email,
    super.password,
    super.avatar_url,
    super.gender,
    super.blood,
    super.is_donor,
    super.birth,
    super.updated_at,
    super.created_at,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      avatar_url: json['avatar_url'],
      gender: json['gender'],
      blood: json['blood'],
      is_donor: json['is_donor'],
      birth: DateTime.parse(json['birth']),
      updated_at: DateTime.parse(json['updated_at']),
      created_at: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'avatar_url': avatar_url,
      'gender': gender,
      'blood': blood,
      'is_donor': is_donor,
      'birth': birth!.toIso8601String(),
    };
  }
}
