import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/view/components/launcher.dart';
import 'package:part_app/view/constants/constant.dart';

class ManagerCard extends StatelessWidget {
  final VoidCallback onSelect;
  final Manager manager;

  const ManagerCard({Key? key, required this.onSelect, required this.manager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.liteDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${manager.managerDetail?[0].name}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            manager.managerDetail?[0].branches?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Text(
                            manager.managerDetail?[0].branches?[index]
                                    .branchName ??
                                'N/A',
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (manager.whatsappNo != null) {
                            Launcher.openWhatsapp(
                              context: context,
                              text: '',
                              number:
                                  '+${manager.countryCode}${manager.managerDetail?[0].whatsappNo}',
                            );
                          }
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00F260),
                          ),
                          child: SvgPicture.asset(
                            Assets.whatsApp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          if (manager.mobileNo != null) {
                            Launcher.makePhoneCall(
                              '+${manager.countryCode}${manager.mobileNo}',
                              context,
                            );
                          }
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF0072FF),
                          ),
                          child: SvgPicture.asset(
                            Assets.phone,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                manager.isActive == 0 ? 'Deactivated' : 'Active',
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color:
                          manager.isActive == 0 ? AppColors.primaryColor : null,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
