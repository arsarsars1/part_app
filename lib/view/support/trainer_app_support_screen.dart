// ignore_for_file: use_build_context_synchronously

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/model/data_model/faq_list.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view_model/cubits.dart';

class TrainerAppSupportScreen extends StatefulWidget {
  const TrainerAppSupportScreen({super.key});

  @override
  State<TrainerAppSupportScreen> createState() =>
      _TrainerAppSupportScreenState();
}

class _TrainerAppSupportScreenState extends State<TrainerAppSupportScreen> {
  String? email, message;
  HomeCubit? cubit;
  AuthCubit? authCubit;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FaqList?> faqList = cubit?.faqList ?? [];
    return Scaffold(
      appBar: const CommonBar(
        title: 'Support',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonField(
                inputType: TextInputType.emailAddress,
                length: 50,
                controller: emailController,
                title: 'Your Email Id *',
                hint: 'Eg: email@example.com',
                capitalization: TextCapitalization.none,
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(emailRegex).hasMatch(value!)) {
                    return 'Invalid email address.';
                  } else {
                    return null;
                  }
                },
                onChange: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonField(
                title: 'Message',
                controller: messageController,
                hint: 'Please enter a message',
                verticalPadding: 10,
                maxLines: 3,
                inputType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  message = value;
                },
                validator: (value) {
                  return value == null || value.toString().isEmpty
                      ? 'Please enter a message.'
                      : null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Button(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      int? res = await cubit?.sendSupportRequestForTrainer(
                          authCubit
                                  ?.user
                                  ?.trainerDetail?[authCubit?.trainerIndex ?? 0]
                                  .id ??
                              0,
                          {
                            'message': message,
                            'email': email,
                          });
                      if (res == 1) {
                        Alert(context).show(message: "Support Request Sent");
                        messageController.text = "";
                        emailController.text = "";
                        setState(() {});
                      } else {
                        Alert(context).show(message: "Server Error");
                      }
                    }
                  },
                  title: 'Send Message',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  'FAQs',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  FaqList? faq = faqList[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      color: AppColors.liteDark,
                      child: ExpandablePanel(
                        header: Text(
                          "${faq?.question}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        collapsed: Text(
                          "${faq?.answer}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Text(
                          "${faq?.answer}",
                          softWrap: true,
                        ),
                        theme: ExpandableThemeData(
                          iconColor: AppColors.grey100,
                          hasIcon: true,
                        ),
                        // tapHeaderToExpand: true,
                        // hasIcon: true,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
