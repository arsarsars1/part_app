import 'package:flutter/material.dart';
import 'package:part_app/view/components/common_bar.dart';

class ClassLinkView extends StatefulWidget {
  static const route = '/class-link';
  const ClassLinkView({Key? key}) : super(key: key);

  @override
  State<ClassLinkView> createState() => _ClassLinkViewState();
}

class _ClassLinkViewState extends State<ClassLinkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(title: 'Online Class'),
      body: ListView(),
    );
  }
}
