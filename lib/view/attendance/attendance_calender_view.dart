import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/batch_model.dart';
// import 'package:part_app/model/data_model/batch_request.dart';
// import 'package:part_app/model/data_model/models.dart';
// import 'package:part_app/model/extensions.dart';
// import 'package:part_app/view/batch/batch_students.dart';
// import 'package:part_app/view/batch/cancel_batch_class.dart';
// import 'package:part_app/view/batch/components/selected_trainers.dart';
// import 'package:part_app/view/batch/edit_batch_details.dart';
// import 'package:part_app/view/batch/reschedule_class.dart';
import 'package:part_app/view/components/components.dart';
// import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view_model/cubits.dart';

class AttendanceCalenderView extends StatefulWidget {
  static const route = '/batch-calender-view';

  const AttendanceCalenderView({Key? key}) : super(key: key);

  @override
  State<AttendanceCalenderView> createState() => _AttendanceCalenderViewState();
}

class _AttendanceCalenderViewState extends State<AttendanceCalenderView> {
  bool isActive = true;
  ScrollController scrollController = ScrollController();
  BatchModel? batch;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<BatchCubit>().getBatchesByStatus(
              branchId: batch?.branchId,
              status: context.read<BatchCubit>().tempStatus,
              clean: true,
            );
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: const CommonBar(
          title: 'Class Attendence',
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       child: BlocConsumer<BatchCubit, BatchState>(
        //         listener: (context, state) {},
        //         builder: (context, state) {
        //           return ListView(
        //             controller: scrollController,
        //             children: [
        //               Container(
        //                 margin: const EdgeInsets.all(16),
        //                 padding: const EdgeInsets.all(16),
        //                 decoration: BoxDecoration(
        //                   color: AppColors.liteDark,
        //                   borderRadius: BorderRadius.circular(4),
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Expanded(
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 "${batch?.name}",
        //                                 maxLines: 2,
        //                                 overflow: TextOverflow.ellipsis,
        //                                 style: Theme.of(context)
        //                                     .textTheme
        //                                     .bodyText1
        //                                     ?.copyWith(
        //                                       fontWeight: FontWeight.bold,
        //                                     ),
        //                               ),
        //                               const SizedBox(
        //                                 height: 4,
        //                               ),
        //                               Text(
        //                                 "${batch?.branchName}",
        //                                 style: Theme.of(context)
        //                                     .textTheme
        //                                     .bodyText1
        //                                     ?.copyWith(
        //                                       color: AppColors.primaryColor,
        //                                     ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           width: 8,
        //                         ),
        //                         GestureDetector(
        //                           onTap: () {
        //                             Navigator.pushNamed(
        //                               context,
        //                               EditBatchDetails.route,
        //                             );
        //                           },
        //                           child: Container(
        //                             width: 24.w,
        //                             height: 24.w,
        //                             decoration: BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               color: Colors.black54,
        //                               border: Border.all(
        //                                 color: Colors.white,
        //                                 width: 2,
        //                               ),
        //                             ),
        //                             child: const Icon(
        //                               Icons.edit_outlined,
        //                               size: 16,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(
        //                       height: 4,
        //                     ),
        //                     Text(
        //                       '${batch?.courseName}, ${batch?.subjectName}',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .bodyText1
        //                           ?.copyWith(),
        //                     ),
        //                     const SizedBox(
        //                       height: 16,
        //                     ),
        //                     ListView.builder(
        //                       padding: EdgeInsets.zero,
        //                       shrinkWrap: true,
        //                       physics: const NeverScrollableScrollPhysics(),
        //                       itemBuilder: (context, index) {
        //                         return Text(
        //                           '${batch?.days[index]}',
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .bodyText1
        //                               ?.copyWith(
        //                                 fontWeight: FontWeight.bold,
        //                               ),
        //                         );
        //                       },
        //                       itemCount: batch?.days.length ?? 0,
        //                     ),
        //                     Align(
        //                       alignment: Alignment.centerRight,
        //                       child: Text(
        //                         'Admission Fees: ₹${batch?.admissionFee.toString().currencyFormat()}/-',
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .bodyText1
        //                             ?.copyWith(),
        //                       ),
        //                     ),
        //                     const SizedBox(
        //                       height: 4,
        //                     ),
        //                     Align(
        //                       alignment: Alignment.centerRight,
        //                       child: Text(
        //                         'Fees: ₹${batch?.fee.toString().currencyFormat()}/-',
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .bodyText1
        //                             ?.copyWith(),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 16),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () => Navigator.pushNamed(
        //                         context,
        //                         RescheduleClass.route,
        //                       ),
        //                       child: Container(
        //                         height: 34.h,
        //                         width: 158.w,
        //                         decoration: BoxDecoration(
        //                           color: AppColors.defaultBlue,
        //                           borderRadius: BorderRadius.circular(45),
        //                         ),
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 12, vertical: 4),
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             const Spacer(),
        //                             Text(
        //                               'Reschedule',
        //                               style: Theme.of(context)
        //                                   .textTheme
        //                                   .bodyText1
        //                                   ?.copyWith(
        //                                     fontSize: 12,
        //                                   ),
        //                             ),
        //                             const Spacer(),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(
        //                       height: 16,
        //                     ),
        //                     GestureDetector(
        //                       onTap: () => Navigator.pushNamed(
        //                         context,
        //                         CancelClass.route,
        //                       ),
        //                       child: Container(
        //                         height: 34.h,
        //                         width: 158.w,
        //                         decoration: BoxDecoration(
        //                           color: AppColors.primaryColor,
        //                           borderRadius: BorderRadius.circular(45),
        //                         ),
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 12, vertical: 4),
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             const Spacer(),
        //                             Text(
        //                               'Cancel',
        //                               style: Theme.of(context)
        //                                   .textTheme
        //                                   .bodyText1
        //                                   ?.copyWith(
        //                                     fontSize: 12,
        //                                   ),
        //                             ),
        //                             const Spacer(),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 width: double.maxFinite,
        //                 margin: const EdgeInsets.all(16),
        //                 padding: const EdgeInsets.all(16),
        //                 decoration: BoxDecoration(
        //                   color: AppColors.liteDark,
        //                   borderRadius: BorderRadius.circular(4),
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     const Text('Batch Trainers'),
        //                     const SizedBox(
        //                       height: 16,
        //                     ),
        //                     SelectedTrainers(
        //                       batchDetails: true,
        //                       branchId: batch?.branchId,
        //                       scaffoldKey: scaffoldKey,
        //                       trainers: batch?.trainers,
        //                       selectedTrainers: (List<Trainer?> value) {
        //                         var trainerList =
        //                             value.map((e) => e?.id).toList();
        //                         if (value.isEmpty) {
        //                           BatchRequest request = const BatchRequest(
        //                             trainers: "",
        //                           );
        //                           context
        //                               .read<BatchCubit>()
        //                               .updateBatch(request);
        //                         } else {
        //                           BatchRequest request = BatchRequest(
        //                             trainers: context
        //                                 .read<BranchCubit>()
        //                                 .trainers
        //                                 ?.where(
        //                                     (element) => trainerList.contains(
        //                                           element.id,
        //                                         ))
        //                                 .map((e) => e.trainerDetail?[0].id)
        //                                 .toList(),
        //                           );
        //                           context
        //                               .read<BatchCubit>()
        //                               .updateBatch(request);
        //                         }
        //                       },
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               BatchStudents(
        //                 onChange: (bool value) {
        //                   isActive = value;
        //                 },
        //               ),
        //             ],
        //           );
        //         },
        //       ),
        //     ),
        //     BlocBuilder<StudentCubit, StudentState>(
        //       builder: (context, state) {
        //         return AnimatedContainer(
        //           height:
        //               state is FetchingStudents && state.pagination ? 30 : 0,
        //           color: Colors.black,
        //           duration: const Duration(
        //             milliseconds: 250,
        //           ),
        //           child: const Center(child: Text('Fetching more items ..')),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
