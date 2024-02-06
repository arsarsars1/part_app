// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_trainer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchTrainerResponseImpl _$$BranchTrainerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchTrainerResponseImpl(
      status: json['status'] as int,
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BranchTrainerResponseImplToJson(
        _$BranchTrainerResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trainers': instance.trainers,
    };
