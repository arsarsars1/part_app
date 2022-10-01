import 'package:equatable/equatable.dart';

class DropDownItem extends Equatable {
  final String? title;
  final dynamic id;
  final dynamic item;

  const DropDownItem({this.title, required this.id, this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, item];
}
