import 'package:equatable/equatable.dart';

class AllPartsModel extends Equatable {
  final String status;
  final List<AllPartsDataModel> data;

  const AllPartsModel({
    required this.status,
    required this.data,
  });

  AllPartsModel copyWith({
    String? status,
    List<AllPartsDataModel>? data,
  }) =>
      AllPartsModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory AllPartsModel.fromJson(Map<String, dynamic> json) => AllPartsModel(
        status: json["status"] ?? '',
        data: json["data"] != null
            ? List<AllPartsDataModel>.from(
                json["data"].map((x) => AllPartsDataModel.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class AllPartsDataModel extends Equatable {
  final int id;
  final String image;
  final double price;
  final String serial;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String description;
  final List<Translation> translations;

  const AllPartsDataModel({
    required this.id,
    required this.image,
    required this.price,
    required this.serial,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.translations,
  });

  AllPartsDataModel copyWith({
    int? id,
    String? image,
    double? price,
    String? serial,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? description,
    List<Translation>? translations,
  }) =>
      AllPartsDataModel(
        id: id ?? this.id,
        image: image ?? this.image,
        price: price ?? this.price,
        serial: serial ?? this.serial,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        description: description ?? this.description,
        translations: translations ?? this.translations,
      );

  factory AllPartsDataModel.fromJson(Map<String, dynamic> json) =>
      AllPartsDataModel(
        id: json["id"] ?? 0,
        image: json["image"] ?? '',
        price: json["price"]?.toDouble() ?? 0.0,
        serial: json["serial"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        translations: json["translations"] != null
            ? List<Translation>.from(
                json["translations"].map((x) => Translation.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [
        id,
        image,
        price,
        serial,
        createdAt,
        updatedAt,
        name,
        description,
        translations,
      ];
}

class Translation extends Equatable {
  final int id;
  final int partId;
  final String locale;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  const Translation({
    required this.id,
    required this.partId,
    required this.locale,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  Translation copyWith({
    int? id,
    int? partId,
    String? locale,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      Translation(
        id: id ?? this.id,
        partId: partId ?? this.partId,
        locale: locale ?? this.locale,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"] ?? 0,
        partId: json["part_id"] ?? 0,
        locale: json["locale"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  @override
  List<Object> get props => [
        id,
        partId,
        locale,
        name,
        description,
        createdAt,
        updatedAt,
      ];
}
