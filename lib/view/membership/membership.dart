import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/view/components/components.dart';
import 'package:part_app/view/membership/components/membership_list.dart';
import 'package:part_app/view/membership/components/pay_checkbox.dart';
import 'package:part_app/view/membership/components/switch.dart';
import 'package:part_app/view_model/membership/membership_cubit.dart';

class Membership extends StatefulWidget {
  static const route = '/membership';

  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  bool free = true;

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
      appBar: AppBar(
        title: const Text('PartApp-membership'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Text(
                  'Select your membership plan',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                      ),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  width: 200,
                  child: MembershipSwitch(
                    onSelect: (bool value) {
                      context.read<MembershipCubit>().filterMembership(value);
                      setState(() {
                        free = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
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
                if (!free)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PayCheckBox(
                      onChange: (bool value) {
                        setState(() {
                          free = value;
                        });
                      },
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<MembershipCubit, MembershipState>(
              builder: (context, state) {
                return SafeArea(
                  child: Center(
                    child: Button(
                      onTap: cubit.selectedMembership == null ? null : () {},
                      title: cubit.selectedMembership?.paymentType == 'free'
                          ? 'Try for free'
                          : 'Pay Now',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
