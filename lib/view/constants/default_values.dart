import 'package:part_app/model/data_model/drop_down_item.dart';

class DefaultValues {
  List<DropDownItem> genders = [
    const DropDownItem(
      id: 'male',
      title: 'Male',
      item: 'Male',
    ),
    const DropDownItem(
      id: 'female',
      title: 'Female',
      item: 'Female',
    ),
    const DropDownItem(
      id: 'other',
      title: 'other',
      item: 'other',
    ),
  ];
  List<DropDownItem> academyType = [
    const DropDownItem(
      id: 'art',
      title: 'Art',
      item: 'Art',
    ),
    const DropDownItem(
      id: 'martialArt',
      title: 'Martial Art',
      item: 'Martial Art',
    ),
    const DropDownItem(
      id: 'other',
      title: 'other',
      item: 'other',
    ),
  ];
}
