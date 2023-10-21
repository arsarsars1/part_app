// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderResponse _$$_OrderResponseFromJson(Map<String, dynamic> json) =>
    _$_OrderResponse(
      id: json['id'] as String,
      entity: json['entity'] as String?,
      amount: json['amount'] as int?,
      amountPaid: json['amountPaid'] as int?,
      amountDue: json['amountDue'] as int?,
      currency: json['currency'] as String?,
      receipt: json['receipt'] as String?,
      offerId: json['offerId'],
      status: json['status'] as String?,
      attempts: json['attempts'] as int?,
      createdAt: json['createdAt'] as int?,
    );

Map<String, dynamic> _$$_OrderResponseToJson(_$_OrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity': instance.entity,
      'amount': instance.amount,
      'amountPaid': instance.amountPaid,
      'amountDue': instance.amountDue,
      'currency': instance.currency,
      'receipt': instance.receipt,
      'offerId': instance.offerId,
      'status': instance.status,
      'attempts': instance.attempts,
      'createdAt': instance.createdAt,
    };

_$_Notes _$$_NotesFromJson(Map<String, dynamic> json) => _$_Notes(
      notesKey1: json['notesKey1'] as String?,
      notesKey2: json['notesKey2'] as String?,
    );

Map<String, dynamic> _$$_NotesToJson(_$_Notes instance) => <String, dynamic>{
      'notesKey1': instance.notesKey1,
      'notesKey2': instance.notesKey2,
    };
