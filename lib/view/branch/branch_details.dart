import 'package:flutter/material.dart';
import 'package:part_app/view/components/common_bar.dart';

class BranchDetails extends StatefulWidget {
  static const route = '/branch/details';

  const BranchDetails({Key? key}) : super(key: key);

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonBar(title: 'Branch Details'),
    );
  }
}
