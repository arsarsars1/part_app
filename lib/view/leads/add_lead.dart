import 'package:flutter/material.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/whatsapp_check.dart';

class AddLead extends StatefulWidget {
  static const route = '/leads/add';

  const AddLead({Key? key}) : super(key: key);

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  String? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBar(
        title: 'Add Lead',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Lead Status *',
              hint: 'Select status',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Name *',
              hint: 'Please enter name',
              length: 50,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Age',
              hint: 'Please enter age',
              length: 50,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Gender',
              hint: 'Please select name',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Mobile Number *',
              hint: 'Please enter number',
              length: 50,
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            WhatsappCheckButton(
              onChange: (value) {},
              onNumberChange: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            BranchField(
              onSelect: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Batch',
              hint: 'Please select batch',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Followup Date',
              hint: 'Please select date',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Followup time',
              hint: 'Please select time',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Assign',
              hint: 'Please select Trainer or Branch Admin',
              length: 50,
              maxLines: 1,
              dropDown: true,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonField(
              title: 'Comments',
              hint: 'Enter Comments',
              maxLines: 5,
              textInputAction: TextInputAction.next,
              onChange: (value) {},
              validator: (value) {
                return value == null || value.toString().isEmpty
                    ? 'Please select lead status.'
                    : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Button(onTap: () {}, title: 'Add Lead'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
