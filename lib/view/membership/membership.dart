import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/view/components/common_bar.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/components/loader.dart';
import 'package:part_app/view/membership/components/cancel_confirmation.dart';
import 'package:part_app/view/membership/components/membership_list.dart';
import 'package:part_app/view/membership/components/pay_checkbox.dart';
import 'package:part_app/view/membership/salesman_phone.dart';
import 'package:part_app/view/membership/subscription_success.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';
import 'package:part_app/view_model/payment/payment_cubit.dart';

class Membership extends StatefulWidget {
  static const route = '/membership';

  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  bool free = true;
  bool onlinePay = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MembershipCubit>().getMembership();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MembershipCubit>();

    return Scaffold(
      appBar: CommonBar(
        enableBack: true,
        title: 'PartApp-membership',
        onPressed: () {
          Cancel(
            context,
            onFree: () {
              // free membership
              Navigator.pop(context);
              cubit.selectedMembership = cubit.memberships.first;
              cubit.addMemberShip(paymentMethod: 'online');
            },
          ).show();
        },
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is GeneratingOrderId) {
                Loader(context, message: 'Please wait..').show();
              }
              if (state is OrderIdGenerated) {
                Navigator.pop(context);
              }

              if (state is PaymentFailed) {
                Alert(context).show(message: state.message);
                return;
              }
              if (state is PaymentSuccess) {
                // Alert(context).show(message: 'Payment success');
              }
            },
          ),
          BlocListener<MembershipCubit, MembershipState>(
            listener: (context, state) {
              if (state is CreatingMembership) {
                Loader(context).show();
              }
              if (state is MembershipSuccess) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  SubscriptionSuccess.route,
                  arguments: false,
                );
              } else if (state is MembershipFailed) {
                Navigator.pop(context);
                Alert(context).show(
                  message: state.error ?? 'Membership creation failed',
                );
              }
            },
          ),
        ],
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    'Select Your Membership Plan',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16.sm,
                        ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Personal Assistance')
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Better Management')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MembershipList(),
                  BlocBuilder<MembershipCubit, MembershipState>(
                    builder: (context, state) {
                      if (cubit.selectedMembership?.paymentType != 'free') {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: PayCheckBox(
                            onChange: (bool value) {
                              setState(() {
                                onlinePay = value;
                              });
                            },
                          ),
                        );
                      } else {
                        return const Offstage();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 126.h,
          child: BottomAppBar(
            color: Colors.black,
            child: Center(
              child: BlocBuilder<MembershipCubit, MembershipState>(
                builder: (context, state) {
                  return Button(
                    disable: cubit.selectedMembership == null,
                    onTap: () {
                      if (cubit.selectedMembership == null) {
                        Alert(context).show(
                          message:
                              'Please select a membership plan to continue.',
                        );
                        return;
                      }

                      if (cubit.selectedMembership?.paymentType == 'free') {
                        cubit.addMemberShip(paymentMethod: 'online');
                        return;
                      }

                      if (!onlinePay) {
                        Navigator.pushNamed(context, SalesManPhone.route);
                      }
                      if (onlinePay) {
                        context
                            .read<PaymentCubit>()
                            .payment(membership: cubit.selectedMembership!);
                      }
                    },
                    title: cubit.selectedMembership?.paymentType == 'free'
                        ? 'Try For Free'
                        : 'Continue',
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
