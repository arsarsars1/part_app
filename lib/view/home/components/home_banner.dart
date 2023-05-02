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
  late Timer timer;
  bool isButtonVisible = false;
  var tempBanner;
  var bannersToDisplay = [];
  bool _initialized = false;
  late DateTime fromTime = DateTime.now();
  late DateTime toTime = DateTime.now();
  late String formattedString;

  @override
  void initState() {
    super.initState();
    /*controller.addListener(() {
      if (controller.page != currentPage) {
        setState(() {
        });
      }
    });*/

    // startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    /*if(cubit.banner != null && cubit.banner!.isNotEmpty && !_initialized){
      for (int i = 0; i < cubit.banner!.length; i++) {
        if(cubit.banner![i].isActive == 1){
          bannersToDisplay.add(cubit.banner![i]);
        }
      }
    }*/
    // _initialized = true;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        if(cubit.banner != null && cubit.banner!.isNotEmpty && !_initialized){
          for (int i = 0; i < cubit.banner!.length; i++) {
            if(cubit.banner![i].isActive == 1){
              bannersToDisplay.add(cubit.banner![i]);
            }
          }
          _initialized = true;
          startTimer();
        }
        // return cubit.banner != null && cubit.banner!.isNotEmpty
        return bannersToDisplay.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // itemCount: cubit.banner?.length ?? 0,
                        itemCount: bannersToDisplay.length ?? 0,
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
                      // itemCount: cubit.banner?.length ?? 0,
                      itemCount: bannersToDisplay.length ?? 0,
                      itemBuilder: (context, index) {
                        // var banner = cubit.banner?[index];
                        var banner = bannersToDisplay[index];
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
                                          // '${banner.startTime?.toTime()} '
                                          '${fromTime.toTime()} '
                                          // 'To ${banner.endTime?.toTime()}, '
                                          'To ${toTime.toTime()}, '
                                          // '${banner.endTime?.formattedString()}',
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
                                      var url = banner.extUrl!.isEmpty?
                                      'https://partapp.in/' : banner.extUrl!;
                                      final uri = Uri.parse(url);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    title: banner.extUrlButtonText!.isEmpty?
                                    'Register Now' : banner.extUrlButtonText!,
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
      if (currentPage < 10) {
        currentPage++;
        setState(() {
          isButtonVisible = tempBanner!.extUrl!.isEmpty?
          false : true;
          fromTime = tempBanner!.startTime;
          toTime = tempBanner!.endTime;
          formattedString = toTime.formattedString();
        });
      } else {
        currentPage = 0;
      }
      controller.animateToPage(currentPage as int,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }
}
