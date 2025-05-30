import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/fee/fee_cubit.dart';

class EditFees extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> reason;
  final ValueChanged<String> date;
  final ValueChanged<String> amount;
  final ValueChanged<DropDownItem>? payment;

  const EditFees({
    super.key,
    this.payment,
    required this.formKey,
    required this.reason,
    required this.date,
    required this.amount,
  });

  @override
  State<EditFees> createState() => EditFeesState();
}

class EditFeesState extends State<EditFees> {
  DropDownItem paymentValue =
      const DropDownItem(id: "Cash", item: "Cash", title: "Cash");
  DateTime? date;
  TextEditingController dateController = TextEditingController();
  late FeeCubit feeCubit;

  @override
  void initState() {
    feeCubit = context.read<FeeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CommonField(
              title: 'Amount *',
              hint: 'Enter Amount',
              maxLines: 1,
              inputType: TextInputType.number,
              contentPadding: EdgeInsets.zero,
              onChange: (value) {
                widget.amount(value);
              },
              validator: (value) {
                return value.toString().trim().isEmpty
                    ? 'Please enter the amount'
                    : null;
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date *',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: dateController,
                  keyboardType: TextInputType.none,
                  onTap: () async {
                    await datePicker();
                    dateController.text = date?.toDateString() ?? "";
                  },
                  readOnly: true,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Please enter date';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white.withOpacity(.7)),
                  textAlign: TextAlign.start,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                      size: 24,
                      color: Colors.white24,
                    ),
                    hintText: 'Select the date',
                    fillColor: AppColors.grey800.withOpacity(.5),
                  ),
                )
              ],
            ),
            if (widget.payment != null)
              Column(children: [
                SizedBox(height: 10.h),
                CommonField(
                  title: 'Payment Mode',
                  hint: 'Select payment mode',
                  length: 50,
                  maxLines: 1,
                  dropDown: true,
                  padding: EdgeInsets.zero,
                  defaultItem: paymentValue,
                  dropDownItems: feeCubit.paymentMethodModel?.paymentMethods
                      .map((e) => DropDownItem(id: e, title: e, item: e))
                      .toList(),
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    paymentValue = value;
                    if (widget.payment != null) {
                      widget.payment!(paymentValue);
                    }
                  },
                ),
              ]),
            SizedBox(height: 10.h),
            CommonField(
              title: 'Remark/Reason For Editing *',
              hint: 'Enter Remark/Reason',
              maxLines: 2,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              onChange: (value) {
                widget.reason(value);
              },
              validator: (value) {
                return value.toString().trim().isEmpty
                    ? 'please enter the reason'
                    : null;
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // method to get the date for [ class ]
  Future<void> datePicker() async {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: Colors.white,
              onSurface: Colors.white, // default text color
              primary: AppColors.primaryColor, // circle color
            ),
            dialogBackgroundColor: AppColors.liteDark,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
    ).then((value) {
      if (value != null) {
        date = value;
        dateController.text = value.toDateString();
        widget.date(value.toServerString());
        setState(() {});
      }
    });
  }
}
