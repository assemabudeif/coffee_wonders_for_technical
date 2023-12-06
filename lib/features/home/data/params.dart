import 'package:equatable/equatable.dart';

class FinishedServiceParams extends Equatable {
  final List<FinishedServicePartParam> parts;

  const FinishedServiceParams({
    required this.parts,
  });

  FinishedServiceParams copyWith({
    List<FinishedServicePartParam>? parts,
  }) =>
      FinishedServiceParams(
        parts: parts ?? this.parts,
      );
  Map<String, dynamic> toJson() => {
        "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        parts,
      ];
}

class FinishedServicePartParam {
  int id;
  int quantity;

  FinishedServicePartParam({
    required this.id,
    required this.quantity,
  });

  FinishedServicePartParam copyWith({
    int? id,
    int? quantity,
  }) =>
      FinishedServicePartParam(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
      };

  List<Object?> get props => [
        id,
        quantity,
      ];
}
