// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_trainer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BranchTrainerResponse _$$_BranchTrainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BranchTrainerResponse(
      status: json['status'] as int,
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BranchTrainerResponseToJson(
        _$_BranchTrainerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trainers': instance.trainers,
    };
