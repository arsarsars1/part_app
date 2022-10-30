import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/action_icon.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/profile_pictrue.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerDetails extends StatefulWidget {
  static const route = '/trainer/details';

  const TrainerDetails({Key? key}) : super(key: key);

  @override
  State<TrainerDetails> createState() => _TrainerDetailsState();
}

class _TrainerDetailsState extends State<TrainerDetails> {
  bool active = true;

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
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 25.0.h,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CupertinoSwitch(
                trackColor: AppColors.grey500,
                value: active,
                onChanged: (value) {
                  setState(() {
                    active = !active;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionIcon(
                asset: Assets.phone,
                color: const Color(0XFF0072FF),
                onTap: () {},
              ),
              ActionIcon(
                asset: Assets.message,
                color: const Color(0XFFFFAC04),
                onTap: () {},
              ),
              ActionIcon(
                asset: Assets.whatsApp,
                color: const Color(0XFF00F260),
                onTap: () {},
              ),
              ActionIcon(
                asset: Assets.email,
                color: const Color(0XFFE56667),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
