import 'package:equatable/equatable.dart';

class AllServiceRequestsModel extends Equatable {
  final String status;
  final List<Datum> data;

  const AllServiceRequestsModel({
    required this.status,
    required this.data,
  });

  AllServiceRequestsModel copyWith({
    String? status,
    List<Datum>? data,
  }) =>
      AllServiceRequestsModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory AllServiceRequestsModel.fromJson(Map<String, dynamic> json) =>
      AllServiceRequestsModel(
        status: json["status"] ?? '',
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [status, data];
}

class Datum extends Equatable {
  final int id;
  final int clientId;
  final int technicalId;
  final String code;
  final String fullname;
  final String email;
  final String phone;
  final String country;
  final String state;
  final String area;
  final String building;
  final String apartment;
  final String postalCode;
  final String startTime;
  final String endTime;
  final int productId;
  final String buyDate;
  final String status;
  final int price;
  final String createdAt;
  final String updatedAt;
  final String hours;
  final String statusString;
  final Product product;
  final Client client;
  final List<Part> parts;
  bool isExpanded;

  Datum({
    this.isExpanded = false,
    required this.id,
    required this.clientId,
    required this.technicalId,
    required this.code,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.country,
    required this.state,
    required this.area,
    required this.building,
    required this.apartment,
    required this.postalCode,
    required this.startTime,
    required this.endTime,
    required this.productId,
    required this.buyDate,
    required this.status,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.hours,
    required this.statusString,
    required this.product,
    required this.client,
    required this.parts,
  });

  Datum copyWith({
    int? id,
    int? clientId,
    int? technicalId,
    String? code,
    String? fullname,
    String? email,
    String? phone,
    String? country,
    String? state,
    String? area,
    String? building,
    String? apartment,
    String? postalCode,
    String? startTime,
    String? endTime,
    int? productId,
    String? buyDate,
    String? status,
    int? price,
    String? createdAt,
    String? updatedAt,
    String? hours,
    String? statusString,
    Product? product,
    Client? client,
    List<Part>? parts,
  }) =>
      Datum(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        technicalId: technicalId ?? this.technicalId,
        code: code ?? this.code,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        country: country ?? this.country,
        state: state ?? this.state,
        area: area ?? this.area,
        building: building ?? this.building,
        apartment: apartment ?? this.apartment,
        postalCode: postalCode ?? this.postalCode,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        productId: productId ?? this.productId,
        buyDate: buyDate ?? this.buyDate,
        status: status ?? this.status,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        hours: hours ?? this.hours,
        statusString: statusString ?? this.statusString,
        product: product ?? this.product,
        client: client ?? this.client,
        parts: parts ?? this.parts,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isExpanded: false,
        id: json["id"] ?? 0,
        clientId: json["client_id"] ?? 0,
        technicalId: json["technical_id"] ?? 0,
        code: json["code"] ?? '',
        fullname: json["fullname"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        country: json["country"] ?? '',
        state: json["state"] ?? '',
        area: json["area"] ?? '',
        building: json["building"] ?? '',
        apartment: json["apartment"] ?? '',
        postalCode: json["postal_code"] ?? '',
        startTime: json["start_time"] ?? '',
        endTime: json["end_time"] ?? '',
        productId: json["product_id"] ?? 0,
        buyDate: json["buy_date"] ?? '',
        status: json["status"] ?? '',
        price: json["price"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        hours: json["hours"] ?? '',
        statusString: json["status_string"] ?? '',
        product: Product.fromJson(json["product"]),
        client: Client.fromJson(json["client"]),
        parts: json["parts"] != null
            ? List<Part>.from(json["parts"].map((x) => Part.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [
        id,
        clientId,
        technicalId,
        code,
        fullname,
        email,
        phone,
        country,
        state,
        area,
        building,
        apartment,
        postalCode,
        startTime,
        endTime,
        productId,
        buyDate,
        status,
        price,
        createdAt,
        updatedAt,
        hours,
        statusString,
        product,
        client,
        parts,
      ];
}

class Client extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  const Client({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Client copyWith({
    int? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Client(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        emailVerifiedAt: json["email_verified_at"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
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

class Part extends Equatable {
  final int id;
  final String image;
  final double price;
  final String serial;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String description;
  final Pivot pivot;
  final List<PartTranslation> translations;

  const Part({
    required this.id,
    required this.image,
    required this.price,
    required this.serial,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.pivot,
    required this.translations,
  });

  Part copyWith({
    int? id,
    String? image,
    double? price,
    String? serial,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? description,
    Pivot? pivot,
    List<PartTranslation>? translations,
  }) =>
      Part(
        id: id ?? this.id,
        image: image ?? this.image,
        price: price ?? this.price,
        serial: serial ?? this.serial,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        description: description ?? this.description,
        pivot: pivot ?? this.pivot,
        translations: translations ?? this.translations,
      );

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"] ?? 0,
        image: json["image"] ?? '',
        price: json["price"]?.toDouble() ?? 0,
        serial: json["serial"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        pivot: Pivot.fromJson(json["pivot"]),
        translations: json["translations"] != null
            ? List<PartTranslation>.from(
                json["translations"].map((x) => PartTranslation.fromJson(x)))
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
        pivot,
        translations,
      ];
}

class Pivot extends Equatable {
  final int serviceId;
  final int partId;
  final int quantity;
  final int price;

  const Pivot({
    required this.serviceId,
    required this.partId,
    required this.quantity,
    required this.price,
  });

  Pivot copyWith({
    int? serviceId,
    int? partId,
    int? quantity,
    int? price,
  }) =>
      Pivot(
        serviceId: serviceId ?? this.serviceId,
        partId: partId ?? this.partId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        serviceId: json["service_id"] ?? 0,
        partId: json["part_id"] ?? 0,
        quantity: json["quantity"] ?? 0,
        price: json["price"] ?? 0,
      );

  @override
  List<Object> get props => [serviceId, partId, quantity, price];
}

class PartTranslation extends Equatable {
  final int id;
  final int partId;
  final String locale;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  const PartTranslation({
    required this.id,
    required this.partId,
    required this.locale,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  PartTranslation copyWith({
    int? id,
    int? partId,
    String? locale,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      PartTranslation(
        id: id ?? this.id,
        partId: partId ?? this.partId,
        locale: locale ?? this.locale,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PartTranslation.fromJson(Map<String, dynamic> json) =>
      PartTranslation(
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

class Product extends Equatable {
  final int id;
  final String photo;
  final String serial;
  final int price;
  final int tax;
  final int discount;
  final String discountType;
  final String createdAt;
  final String updatedAt;
  final int brandId;
  final int total;
  final String discountTypeText;
  final int stock;
  final String name;
  final String description;
  final Brand brand;
  final List<Stock> stocks;
  final List<ProductTranslation> translations;

  const Product({
    required this.id,
    required this.photo,
    required this.serial,
    required this.price,
    required this.tax,
    required this.discount,
    required this.discountType,
    required this.createdAt,
    required this.updatedAt,
    required this.brandId,
    required this.total,
    required this.discountTypeText,
    required this.stock,
    required this.name,
    required this.description,
    required this.brand,
    required this.stocks,
    required this.translations,
  });

  Product copyWith({
    int? id,
    String? photo,
    String? serial,
    int? price,
    int? tax,
    int? discount,
    String? discountType,
    String? createdAt,
    String? updatedAt,
    int? brandId,
    int? total,
    String? discountTypeText,
    int? stock,
    String? name,
    String? description,
    Brand? brand,
    List<Stock>? stocks,
    List<ProductTranslation>? translations,
  }) =>
      Product(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        serial: serial ?? this.serial,
        price: price ?? this.price,
        tax: tax ?? this.tax,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        brandId: brandId ?? this.brandId,
        total: total ?? this.total,
        discountTypeText: discountTypeText ?? this.discountTypeText,
        stock: stock ?? this.stock,
        name: name ?? this.name,
        description: description ?? this.description,
        brand: brand ?? this.brand,
        stocks: stocks ?? this.stocks,
        translations: translations ?? this.translations,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        photo: json["photo"] ?? '',
        serial: json["serial"] ?? '',
        price: json["price"] ?? 0,
        tax: json["tax"] ?? 0,
        discount: json["discount"] ?? 0,
        discountType: json["discount_type"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        brandId: json["brand_id"] ?? 0,
        total: json["total"] ?? 0,
        discountTypeText: json["discount_type_text"] ?? '',
        stock: json["stock"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        brand: Brand.fromJson(json["brand"]),
        stocks: json["stocks"] != null
            ? List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x)))
            : [],
        translations: json["translations"] != null
            ? List<ProductTranslation>.from(
                json["translations"].map((x) => ProductTranslation.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [
        id,
        photo,
        serial,
        price,
        tax,
        discount,
        discountType,
        createdAt,
        updatedAt,
        brandId,
        total,
        discountTypeText,
        stock,
        name,
        description,
        brand,
        stocks,
        translations,
      ];
}

class Brand extends Equatable {
  final int id;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String photo;
  final String name;
  final List<BrandTranslation> translations;

  const Brand({
    required this.id,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.photo,
    required this.name,
    required this.translations,
  });

  Brand copyWith({
    int? id,
    int? categoryId,
    String? createdAt,
    String? updatedAt,
    String? photo,
    String? name,
    List<BrandTranslation>? translations,
  }) =>
      Brand(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        photo: photo ?? this.photo,
        name: name ?? this.name,
        translations: translations ?? this.translations,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        categoryId: json["category_id"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        photo: json["photo"] ?? '',
        name: json["name"] ?? '',
        translations: json["translations"] != null
            ? List<BrandTranslation>.from(
                json["translations"].map((x) => BrandTranslation.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [
        id,
        categoryId,
        createdAt,
        updatedAt,
        photo,
        name,
        translations,
      ];
}

class BrandTranslation extends Equatable {
  final int id;
  final int brandId;
  final String locale;
  final String name;
  final String createdAt;
  final String updatedAt;

  const BrandTranslation({
    required this.id,
    required this.brandId,
    required this.locale,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  BrandTranslation copyWith({
    int? id,
    int? brandId,
    String? locale,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) =>
      BrandTranslation(
        id: id ?? this.id,
        brandId: brandId ?? this.brandId,
        locale: locale ?? this.locale,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory BrandTranslation.fromJson(Map<String, dynamic> json) =>
      BrandTranslation(
        id: json["id"] ?? 0,
        brandId: json["brand_id"] ?? 0,
        locale: json["locale"] ?? '',
        name: json["name"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  @override
  List<Object> get props => [
        id,
        brandId,
        locale,
        name,
        createdAt,
        updatedAt,
      ];
}

class Stock extends Equatable {
  final int id;
  final int warehouseId;
  final int productId;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  const Stock({
    required this.id,
    required this.warehouseId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  Stock copyWith({
    int? id,
    int? warehouseId,
    int? productId,
    int? quantity,
    String? createdAt,
    String? updatedAt,
  }) =>
      Stock(
        id: id ?? this.id,
        warehouseId: warehouseId ?? this.warehouseId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"] ?? 0,
        warehouseId: json["warehouse_id"] ?? 0,
        productId: json["product_id"] ?? 0,
        quantity: json["quantity"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
      );

  @override
  List<Object> get props => [
        id,
        warehouseId,
        productId,
        quantity,
        createdAt,
        updatedAt,
      ];
}

class ProductTranslation extends Equatable {
  final int id;
  final int productId;
  final String locale;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String description;

  const ProductTranslation({
    required this.id,
    required this.productId,
    required this.locale,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
  });

  ProductTranslation copyWith({
    int? id,
    int? productId,
    String? locale,
    String? name,
    String? createdAt,
    String? updatedAt,
    String? description,
  }) =>
      ProductTranslation(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        locale: locale ?? this.locale,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
      );

  factory ProductTranslation.fromJson(Map<String, dynamic> json) =>
      ProductTranslation(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        locale: json["locale"] ?? '',
        name: json["name"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        description: json["description"] ?? '',
      );

  @override
  List<Object> get props => [
        id,
        productId,
        locale,
        name,
        createdAt,
        updatedAt,
        description,
      ];
}
