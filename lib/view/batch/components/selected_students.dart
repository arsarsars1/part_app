import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/trainer/students_picker.dart';
import 'package:part_app/view_model/cubits.dart';

class SelectedStudents extends StatefulWidget {
  const SelectedStudents({Key? key}) : super(key: key);

  @override
  State<SelectedStudents> createState() => _SelectedStudentsState();
}

class _SelectedStudentsState extends State<SelectedStudents> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BatchCubit>();
    var width = MediaQuery.of(context).size.width / 6.5;
    return BlocBuilder<BatchCubit, BatchState>(
      builder: (context, state) {
        return Wrap(
          alignment: WrapAlignment.start,
          children: [
            ...cubit.studentData.map(
              (e) {
                var detail = e;
                return GestureDetector(
                  onTap: () {
                    cubit.removeContact1(e);
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50.h,
                            color: AppColors.grey100,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              '${detail.name}',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ],
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
                          ))
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudentPicker.route,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                  right: 16,
                  bottom: 8,
                  left: 16,
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
                width: width,
                height: width,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
