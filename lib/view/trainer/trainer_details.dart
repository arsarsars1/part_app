import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/profile_pictrue.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerDetails extends StatefulWidget {
  static const route = '/trainer/details';

  const TrainerDetails({Key? key}) : super(key: key);

  @override
  State<TrainerDetails> createState() => _TrainerDetailsState();
}

class _TrainerDetailsState extends State<TrainerDetails> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrainerCubit>();
    return Scaffold(
      appBar: const CommonBar(title: 'Trainer Profile'),
      body: ListView(
        children: [
          Center(
            child: ProfilePicture(
              onEdit: () {},
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${cubit.trainer?.user?.name}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
