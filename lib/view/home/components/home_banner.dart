import 'dart:async';

import 'package:flutter/material.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/app_colors.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  PageController controller = PageController();
  int currentPage = 0;
  int scrollLimit = 0;
  int? adminAcademyTypeId;
  late Timer timer;
  bool isButtonVisible = false;
  bool _initialized = false;
  var tempBanner;
  var activeBanners = [];
  late DateTime fromTime = DateTime.now();
  late DateTime toTime = DateTime.now();
  late String formattedString = toTime.formattedString();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (cubit.banner != null && cubit.banner!.isNotEmpty && !_initialized) {
          if (authCubit.user?.adminDetail?.academy != null) {
            adminAcademyTypeId =
                authCubit.user?.adminDetail?.academy!.academyTypeId;
          }
          for (int i = 0; i < cubit.banner!.length; i++) {
            if (cubit.banner![i].isActive == 1 &&
                adminAcademyTypeId == cubit.banner![i].academyTypeId) {
              activeBanners.add(cubit.banner![i]);
            }
          }
          if (activeBanners.isNotEmpty) {
            fromTime = activeBanners[0].startTime;
            toTime = activeBanners[0].endTime;
            formattedString = toTime.formattedString();
            scrollLimit = activeBanners.length - 1;
          }
          _initialized = true;
          startTimer();
        }
        return activeBanners.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: activeBanners.length ?? 0,
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
                      onPageChanged: (int pageIndex) {
                        setState(() {
                          isButtonVisible =
                              tempBanner!.extUrl!.isEmpty ? false : true;
                          fromTime = tempBanner!.startTime;
                          toTime = tempBanner!.endTime;
                          formattedString = toTime.formattedString();
                        });
                      },
                      itemCount: activeBanners.length ?? 0,
                      itemBuilder: (context, index) {
                        var banner = activeBanners[index];
                        tempBanner = banner;
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
                                          '${fromTime.toTime()} '
                                          'To ${toTime.toTime()}, '
                                          '${formattedString}',
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
                                  if (isButtonVisible)
                                    Button(
                                      backgroundColor: AppColors.defaultBlue,
                                      height: 22.h,
                                      width: 97.w,
                                      fontSize: 10.sp,
                                      onTap: () async {
                                        var url = banner.extUrl!.isEmpty
                                            ? 'https://partapp.in/'
                                            : banner.extUrl!;
                                        final uri = Uri.parse(url);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      title: banner.extUrlButtonText!.isEmpty
                                          ? 'Register Now'
                                          : banner.extUrlButtonText!,
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

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < scrollLimit) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      controller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }
}
