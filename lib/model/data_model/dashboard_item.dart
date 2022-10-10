import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardItem extends Equatable {
  final String title;
  final String asset;
  final String route;
  final Color color;

  const DashboardItem({
    required this.title,
    required this.route,
    required this.asset,
    required this.color,
  });

  @override
  List<Object?> get props => [title, route, asset, color];
}
