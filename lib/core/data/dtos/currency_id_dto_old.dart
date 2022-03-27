import 'dart:convert';

import 'package:loan_app/core/domain/entities/entities.dart';


class CurrencyIdDtoOld {
  CurrencyIdDtoOld({
    required this.id,
    required this.name,
    required this.fiatcode,
    required this.description,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrencyIdDtoOld.fromMap(Map<String, dynamic> map) {
    return CurrencyIdDtoOld(
      id: map['_id'],
      name: map['name'],
      fiatcode: map['fiatcode'],
      description: map['description'],
      country: map['country'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory CurrencyIdDtoOld.fromJson(String source) =>
      CurrencyIdDtoOld.fromMap(json.decode(source));

  final String id;
  final String name;
  final String fiatcode;
  final String description;
  final String country;
  final String createdAt;
  final String updatedAt;

  CurrencyId toEntity() {
    return CurrencyId(
      id: id,
      name: name,
      fiatCode: fiatcode,
      description: description,
      country: country,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  CurrencyIdDtoOld copyWith({
    String? id,
    String? name,
    String? fiatcode,
    String? description,
    String? country,
    String? createdAt,
    String? updatedAt,
  }) {
    return CurrencyIdDtoOld(
      id: id ?? this.id,
      name: name ?? this.name,
      fiatcode: fiatcode ?? this.fiatcode,
      description: description ?? this.description,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'fiatcode': fiatcode,
      'description': description,
      'country': country,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Currencyid(_id: $id, name: $name, fiatcode: $fiatcode, '
        'description: $description, country: $country, createdAt: '
        '$createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyIdDtoOld &&
        other.id == id &&
        other.name == name &&
        other.fiatcode == fiatcode &&
        other.description == description &&
        other.country == country &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fiatcode.hashCode ^
        description.hashCode ^
        country.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
