import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String status;
  final Data data;

  const LoginModel({
    required this.status,
    required this.data,
  });

  LoginModel copyWith({
    String? status,
    Data? data,
  }) =>
      LoginModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  @override
  List<Object> get props => [status, data];
}

class Data extends Equatable {
  final String token;
  final User user;

  const Data({
    required this.token,
    required this.user,
  });

  Data copyWith({
    String? token,
    User? user,
  }) =>
      Data(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  @override
  List<Object> get props => [token, user];
}

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  @override
  List<Object> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
      ];
}
