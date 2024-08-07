// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      id: json['id'] as String,
      entity: json['entity'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      amountPaid: (json['amountPaid'] as num?)?.toInt(),
      amountDue: (json['amountDue'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      receipt: json['receipt'] as String?,
      offerId: json['offerId'],
      status: json['status'] as String?,
      attempts: (json['attempts'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
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

_$NotesImpl _$$NotesImplFromJson(Map<String, dynamic> json) => _$NotesImpl(
      notesKey1: json['notesKey1'] as String?,
      notesKey2: json['notesKey2'] as String?,
    );

Map<String, dynamic> _$$NotesImplToJson(_$NotesImpl instance) =>
    <String, dynamic>{
      'notesKey1': instance.notesKey1,
      'notesKey2': instance.notesKey2,
    };
