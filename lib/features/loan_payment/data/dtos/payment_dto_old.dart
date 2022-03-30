import 'dart:convert';

import 'package:loan_app/features/features.dart';

class PaymentDtoOld {
  PaymentDtoOld({
    required this.status,
    required this.id,
    required this.customerid,
    required this.principalamount,
    required this.interestamount,
    required this.paymentamount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentDtoOld.fromMap(Map<String, dynamic> map) {
    return PaymentDtoOld(
      status: map['status'] ?? '',
      id: map['_id'] ?? '',
      customerid: map['customerid'] ?? '',
      // ignore: avoid_dynamic_calls
      principalamount: map['principalamount']?.toDouble() ?? 0.0,
      // ignore: avoid_dynamic_calls
      interestamount: map['interestamount']?.toDouble() ?? 0.0,
      // ignore: avoid_dynamic_calls
      paymentamount: map['paymentamount']?.toDouble() ?? 0.0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  factory PaymentDtoOld.fromJson(String source) =>
      PaymentDtoOld.fromMap(json.decode(source));

  final String status;
  final String id;
  final String customerid;
  final double principalamount;
  final double interestamount;
  final double paymentamount;
  final String createdAt;
  final String updatedAt;

  Payment toEntity() {
    return Payment(
      status: status,
      id: id,
      customerId: customerid,
      principalAmount: principalamount,
      interestAmount: interestamount,
      paymentAmount: paymentamount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  PaymentDtoOld copyWith({
    String? status,
    String? id,
    String? customerid,
    double? principalamount,
    double? interestamount,
    double? paymentamount,
    String? createdAt,
    String? updatedAt,
  }) {
    return PaymentDtoOld(
      status: status ?? this.status,
      id: id ?? this.id,
      customerid: customerid ?? this.customerid,
      principalamount: principalamount ?? this.principalamount,
      interestamount: interestamount ?? this.interestamount,
      paymentamount: paymentamount ?? this.paymentamount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'id': id,
      'customerid': customerid,
      'principalamount': principalamount,
      'interestamount': interestamount,
      'paymentamount': paymentamount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PaymentDtoOld(status: $status, id: $id, customerid: $customerid, '
        'principalamount: $principalamount, interestamount: $interestamount, '
        'paymentamount: $paymentamount, createdAt: $createdAt, '
        'updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentDtoOld &&
        other.status == status &&
        other.id == id &&
        other.customerid == customerid &&
        other.principalamount == principalamount &&
        other.interestamount == interestamount &&
        other.paymentamount == paymentamount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        id.hashCode ^
        customerid.hashCode ^
        principalamount.hashCode ^
        interestamount.hashCode ^
        paymentamount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
