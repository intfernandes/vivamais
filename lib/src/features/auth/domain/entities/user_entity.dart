class UserEntity {
  final String? uid;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? phone;
  final String? email;
  final String? avatar_url;
  final String? gender;
  final String? blood;
  final bool? is_donor;
  final DateTime? birth;
  final DateTime? updated_at;
  final DateTime? created_at;

  UserEntity({
    this.uid,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.avatar_url,
    this.password,
    this.gender,
    this.blood,
    this.is_donor,
    this.birth,
    this.updated_at,
    this.created_at,
  });
}
