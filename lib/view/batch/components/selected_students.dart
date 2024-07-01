import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/trainer/students_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class SelectedStudents extends StatefulWidget {
  const SelectedStudents({super.key});

  @override
  State<SelectedStudents> createState() => _SelectedStudentsState();
}

class _SelectedStudentsState extends State<SelectedStudents> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<BatchCubit, BatchState>(
      builder: (context, state) {
        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          children: [
            ...cubit.studentData.map(
              (e) {
                var detail = e;
                return GestureDetector(
                  onTap: () {
                    cubit.removeContact1(e);
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 70.h,
                            color: AppColors.grey100,
                          ),
                          Container(
                            height: 20.h,
                            width: 20.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey400,
                              border: Border.all(
                                color: AppColors.grey400,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.black,
                                size: 15.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        width: width,
                        child: Text(
                          '${detail.name}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () async {
                cubit.isFromBatchDetail = false;
                await Navigator.pushNamed(
                  context,
                  StudentPicker.route,
                );
                if (cubit.days.isEmpty) {
                  cubit.days.clear();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(
                  right: 12,
                  bottom: 8,
                  left: 12,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey400,
                  border: Border.all(
                    color: AppColors.grey700,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                // width: width,
                // height: width,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
