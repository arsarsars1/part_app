import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';

class CommonField extends StatelessWidget {
  final String title;
  final String? hint;
  final bool dropDown;
  final List<DropDownItem>? dropDownItems;
  final DropDownItem? defaultItem;
  final ValueChanged<dynamic> onChange;

  const CommonField(
      {Key? key,
      required this.title,
      this.hint,
      this.dropDown = false,
      this.dropDownItems,
      this.defaultItem,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropDownItem? selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 8,
          ),
          dropDown
              ? DropdownButtonFormField<DropDownItem>(
                  dropdownColor: Colors.black,
                  value: selectedItem ?? defaultItem,
                  items: dropDownItems?.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.title ?? '',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedItem = value;
                    onChange(value);
                  },
                )
              : TextFormField(
                  onChanged: (value) {
                    onChange(value);
                  },
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: hint,
                  ),
                ),
        ],
      ),
    );
  }
}
