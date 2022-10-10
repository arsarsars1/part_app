import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';

class CommonField extends StatelessWidget {
  final String title;
  final String? hint;
  final bool dropDown;
  final List<DropDownItem>? dropDownItems;
  final DropDownItem? defaultItem;
  final ValueChanged<dynamic> onChange;
  final bool disabled;
  final String? initialValue;
  final Color? fillColor;
  final Color? textColor;
  final int? maxLines;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CommonField(
      {Key? key,
      required this.title,
      this.hint,
      this.dropDown = false,
      this.dropDownItems,
      this.defaultItem,
      this.initialValue,
      this.fillColor,
      this.textColor,
      this.maxLines,
      this.onTap,
      this.controller,
      required this.onChange,
      this.disabled = false})
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
                  hint: hint != null
                      ? Text(
                          hint!,
                          style:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                        )
                      : null,
                  dropdownColor:
                      Theme.of(context).inputDecorationTheme.fillColor,
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
                  controller: controller,
                  onTap: onTap,
                  maxLines: maxLines,
                  minLines: maxLines,
                  readOnly: disabled,
                  initialValue: initialValue,
                  onChanged: (value) {
                    onChange(value);
                  },
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: textColor),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: hint,
                    fillColor: fillColor,
                  ),
                ),
        ],
      ),
    );
  }
}
