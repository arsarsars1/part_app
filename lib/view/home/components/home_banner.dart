import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  PageController controller = PageController();
  double? currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page != currentPage) {
        setState(() {
          currentPage = controller.page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return cubit.banner != null && cubit.banner!.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.banner?.length ?? 0,
                        itemBuilder: (context, index) {
                          bool selected = index == currentPage;
                          return Container(
                            height: 2,
                            width: 15,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: selected
                                  ? Colors.white
                                  : const Color(
                                      0xFF8B8B8B,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 141.h,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: cubit.banner?.length ?? 0,
                      itemBuilder: (context, index) {
                        var banner = cubit.banner?[index];
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(banner!.imageUrl!),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      color: Colors.black.withOpacity(
                                        0.44,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          banner.description ?? '',
                                        ),
                                        Text(
                                          '${banner.startTime?.toTime()} '
                                          'To ${banner.endTime?.toTime()}, '
                                          '${banner.endTime?.formattedString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                fontSize: 10,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Button(
                                    backgroundColor: AppColors.defaultBlue,
                                    height: 22.h,
                                    width: 97.w,
                                    fontSize: 10.sp,
                                    onTap: () {},
                                    title: 'Register Now',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Offstage();
      },
    );
  }
}
