import 'package:flutter/material.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/constants/app_colors.dart';

class TodayFollowView extends StatefulWidget {
  static const route = '/leads/followups';

  const TodayFollowView({Key? key}) : super(key: key);

  @override
  State<TodayFollowView> createState() => _TodayFollowViewState();
}

class _TodayFollowViewState extends State<TodayFollowView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Today\'s Lead Followups'),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.liteDark,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gamini',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'New Lead',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Not Interested',
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.liteDark,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leo Elstin',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'New Lead',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text(
                    'New Lead',
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.liteDark,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yamini',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Busy'
                        '',
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Not Interested',
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
