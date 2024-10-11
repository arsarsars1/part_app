// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  PageController bannerPageController = PageController();
  bool _isUserHoldingPage = false;
  int currentPage = 0;
  int scrollLimit = 0;
  int? adminAcademyTypeId;
  Timer? timer;
  bool isButtonVisible = false;
  bool _initialized = false;
  var activeBanners = [];
  DateTime fromTime = DateTime.now();
  DateTime toTime = DateTime.now();
  late String formattedString = toTime.formattedString();

  @override
  void dispose() {
    activeBanners.clear();
    bannerPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is DashboardLoaded,
      builder: (context, state) {
        if (state is DashboardLoaded && !_initialized) {
          // Fetch banners only if not already initialized
          _initializeBanners(
              state, authCubit, cubit); // Extracted logic to a method
        } else if (state is DashboardLoaded) {
          // Update banners when the state changes
          _updateBanners(state, cubit);
        }
        return activeBanners.isNotEmpty
            ? GestureDetector(
                onLongPressStart: (_) {
                  setState(() {
                    _isUserHoldingPage = true;
                    stopTimer();
                  });
                },
                onLongPressEnd: (_) {
                  setState(() {
                    _isUserHoldingPage = false;
                    startTimer();
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: activeBanners.length,
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 165.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: PageView.builder(
                          controller: bannerPageController,
                          onPageChanged: (int pageIndex) {
                            setState(() {
                              currentPage = pageIndex;
                              isButtonVisible =
                                  (activeBanners[pageIndex]?.extUrl?.isEmpty ??
                                          true)
                                      ? false
                                      : true;
                              fromTime = activeBanners[pageIndex]!.startTime;
                              toTime = activeBanners[pageIndex]!.endTime;
                              formattedString = toTime.formattedString();
                            });
                          },
                          itemCount: activeBanners.length,
                          itemBuilder: (context, index) {
                            var banner = activeBanners[index];
                            return CachedNetworkImage(
                              imageUrl: banner?.imageUrl ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
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
                                              // Text(
                                              //   '${fromTime.toTime()} '
                                              //   'To ${toTime.toTime()}, '
                                              //   '$formattedString',
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .bodyLarge
                                              //       ?.copyWith(
                                              //         fontSize: 10,
                                              //       ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        if (isButtonVisible)
                                          Button(
                                            backgroundColor:
                                                AppColors.defaultBlue,
                                            height: 22.h,
                                            width: 97.w,
                                            fontSize: 10.sp,
                                            onTap: () async {
                                              var url =
                                                  (banner.extUrl?.isEmpty ??
                                                          true)
                                                      ? 'https://partapp.in/'
                                                      : (banner.extUrl ?? '');
                                              final uri = Uri.parse(url);
                                              if (await canLaunchUrl(uri)) {
                                                await launchUrl(uri);
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            title: (banner.extUrlButtonText
                                                        ?.isEmpty ??
                                                    true)
                                                ? 'Register Now'
                                                : banner.extUrlButtonText!,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Offstage();
      },
    );
  }

  void _initializeBanners(
      DashboardLoaded state, AuthCubit authCubit, HomeCubit cubit) {
    if (cubit.banner != null && cubit.banner!.isNotEmpty) {
      if (authCubit.user?.adminDetail?.academy != null) {
        adminAcademyTypeId =
            authCubit.user?.adminDetail?.academy!.academyTypeId;
      }

      activeBanners =
          cubit.banner!.where((banner) => banner.isActive == 1).toList();

      if (activeBanners.isNotEmpty) {
        fromTime = activeBanners[0].startTime;
        toTime = activeBanners[0].endTime;
        formattedString = toTime.formattedString();
        scrollLimit = activeBanners.length - 1;
      }
      _initialized = true;
      startTimer();
    }
  }

  void _updateBanners(DashboardLoaded state, HomeCubit cubit) {
    var updatedBanners =
        cubit.banner!.where((banner) => banner.isActive == 1).toList();

    if (updatedBanners.length != activeBanners.length ||
        !_listEquals(updatedBanners, activeBanners)) {
      setState(() {
        activeBanners = updatedBanners;
        if (activeBanners.isNotEmpty) {
          fromTime = activeBanners[0].startTime;
          toTime = activeBanners[0].endTime;
          formattedString = toTime.formattedString();
          scrollLimit = activeBanners.length - 1;
        }
      });
    }
  }

  bool _listEquals(List<dynamic> list1, List<dynamic> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  void startTimer() {
    if (context.mounted) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (!_isUserHoldingPage) {
          if (currentPage < scrollLimit) {
            currentPage++;
          } else {
            currentPage = 0;
          }
          if (bannerPageController.hasClients) {
            bannerPageController.animateToPage(currentPage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          }
        }
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
  }
}
