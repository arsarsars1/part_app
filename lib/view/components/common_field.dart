import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final int? length;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool phoneField;
  final bool singleLine;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final double? letterSpacing;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets? padding;

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
      this.inputType,
      this.textAlign,
      this.textInputAction,
      this.letterSpacing,
      this.suffixIcon,
      this.length,
      this.validator,
      this.padding,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.phoneField = false,
      this.singleLine = false,
      required this.onChange,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropDownItem? selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
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
                  validator: validator,
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
                  maxLength: length,
                  controller: controller,
                  onTap: onTap,
                  maxLines: maxLines,
                  minLines: maxLines,
                  readOnly: disabled,
                  initialValue: initialValue,
                  keyboardType: inputType,
                  validator: validator,
                  onChanged: (value) {
                    onChange(value);
                  },
                  textInputAction: textInputAction,
                  buildCounter: (
                    BuildContext context, {
                    required int currentLength,
                    int? maxLength,
                    required bool isFocused,
                  }) =>
                      const SizedBox(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: textColor,
                        letterSpacing: letterSpacing,
                      ),
                  inputFormatters: phoneField
                      ? [
                          FilteringTextInputFormatter.digitsOnly,
                        ]
                      : null,
                  textAlign: textAlign ?? TextAlign.start,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: padding,
                    suffixIcon: suffixIcon,
                    hintText: hint,
                    fillColor: fillColor,
                  ),
                ),
        ],
      ),
    );
  }
}
