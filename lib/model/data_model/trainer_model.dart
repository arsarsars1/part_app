import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/trainer_response.dart';

class TrainerModel {
  final String? trainerName;
  final String? branchName;
  final int id;
  final int? detailId;
  final String? profilePic;
  final String? expertise;
  final String? type;

  TrainerModel({
    this.trainerName,
    this.branchName,
    required this.id,
    this.profilePic,
    this.detailId,
    this.expertise,
    this.type,
  });

  factory TrainerModel.fromEntity(Trainer trainer) {
    Trainer? detail = trainer.trainerDetail?[0];
    return TrainerModel(
      id: trainer.id,
      detailId: detail?.id,
      trainerName: detail?.name,
      profilePic: '${F.baseUrl}/admin/images/'
          'trainer/${detail?.id}/${detail?.profilePic}',
      expertise: detail?.expertise,
    );
  }
}
