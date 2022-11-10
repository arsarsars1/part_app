import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/manager/add_manager.dart';
import 'package:part_app/view/manager/components/card_card.dart';
import 'package:part_app/view/manager/manager_details.dart';
import 'package:part_app/view_model/cubits.dart';

class ManagerPage extends StatefulWidget {
  static const route = '/manager';

  const ManagerPage({Key? key}) : super(key: key);

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ManagerCubit>().getManagers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Branch Manager'),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
              ),
              child: Button(
                height: 30.h,
                width: 203.w,
                onTap: () => Navigator.pushNamed(context, AddManager.route),
                title: 'Add New Branch Manager',
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<ManagerCubit, ManagerState>(
            builder: (context, state) {
              var cubit = context.read<ManagerCubit>();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.managers?.length ?? 0,
                itemBuilder: (context, index) {
                  Manager manager = cubit.managers![index];
                  return ManagerCard(
                    onSelect: () {
                      if (manager.user?.id != null) {
                        context.read<ManagerCubit>().getManagerById(
                              id: manager.id,
                            );

                        Navigator.pushNamed(context, ManagerDetails.route);
                      }
                    },
                    manager: manager,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
