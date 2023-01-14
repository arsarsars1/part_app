import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/constants/assets.dart';
import 'package:part_app/view/leads/add_lead.dart';

class Leads extends StatefulWidget {
  const Leads({Key? key}) : super(key: key);

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Leads',
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AddLead.route),
            child: Container(
              margin: EdgeInsets.all(16.r),
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC6C6C6),
                    Color(0xFFffffff),
                    Color(0xFFffffff),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add New Lead',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Image.asset(Assets.newLeadImage),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.r),
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFFffffff),
                  Color(0xFFffffff),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Follow Up',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Image.asset(Assets.todayFollowUp),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.r),
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFFffffff),
                  Color(0xFFffffff),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Leads',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Image.asset(Assets.allLeads),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.r),
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC6C6C6),
                  Color(0xFFffffff),
                  Color(0xFFffffff),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tips & Ideas',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Image.asset(Assets.tipsIdeas),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
