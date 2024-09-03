// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:part_app/view/components/components.dart';
// import 'package:part_app/view/membership/components/pay_checkbox.dart';
// import 'package:part_app/view/membership/salesman_phone.dart';
// import 'package:part_app/view/membership/subscription_success.dart';
// import 'package:part_app/view_model/inapp_purchase/inapp_cubit.dart';
// import 'package:part_app/view_model/membership/membership_cubit.dart';
//
// import '../../constants/app_colors.dart';
//
// class MembershipHomeIos extends StatefulWidget {
//   static const route = '/membership-home-ios';
//
//   const MembershipHomeIos({super.key});
//
//   @override
//   State<MembershipHomeIos> createState() => _MembershipHomeIosState();
// }
//
// class _MembershipHomeIosState extends State<MembershipHomeIos> {
//   bool free = true;
//   bool onlinePay = true;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<InappCubit>().loadPurchases();
//     });
//   }
//
//   @override
//   void dispose() {
//     context.read<InappCubit>().dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = context.read<InappCubit>();
//
//     return Scaffold(
//       appBar: const CommonBar(
//         title: 'PartApp-membership',
//       ),
//       body: BlocListener<MembershipCubit, MembershipState>(
//         listener: (context, state) {
//           if (state is CreatingMembership) {
//             Loader(context).show();
//           }
//           if (state is MembershipSuccess) {
//             Navigator.pop(context);
//             Navigator.pushReplacementNamed(
//               context,
//               SubscriptionSuccess.route,
//               arguments: false,
//             );
//           } else if (state is MembershipFailed) {
//             Navigator.pop(context);
//             Alert(context).show(
//               message: state.error ?? 'Membership creation failed',
//             );
//           }
//         },
//         child: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 26.h,
//                   ),
//                   Text(
//                     'Select Your Membership Plan',
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontSize: 16.sp,
//                         ),
//                   ),
//                   const SizedBox(
//                     height: 28,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.check_circle_outline_outlined,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Text('Personal Assistance')
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.check_circle_outline_outlined,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Text('Better Management')
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: BlocBuilder<InappCubit, InappState>(
//                         builder: (context, state) {
//                       if (state is InappLoading) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (state is InappListed) {
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: state.products.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 cubit.selectedProduct = state.products[index];
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 8),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 16),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: cubit.selectedProduct?.id ==
//                                           state.products[index].id
//                                       ? AppColors.primaryColor.withOpacity(0.35)
//                                       : AppColors.liteDark,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(state.products.first.title),
//                                     const SizedBox(
//                                       height: 2,
//                                     ),
//                                     Text(
//                                       'Membership Plan',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                             color: AppColors.primaryColor,
//                                             fontSize: 13,
//                                           ),
//                                     ),
//                                     const SizedBox(
//                                       height: 4,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               state.products.first.description,
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyLarge
//                                                   ?.copyWith(
//                                                     fontSize: 14,
//                                                   ),
//                                             ),
//                                             const SizedBox(
//                                               height: 2,
//                                             ),
//                                             Text(
//                                               state.products.first.description,
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyLarge
//                                                   ?.copyWith(
//                                                     fontSize: 14,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                         const Spacer(),
//                                         Column(
//                                           children: [
//                                             if (state.products[index].price !=
//                                                 '\$0/-')
//                                               Text(
//                                                 '${state.products[index].price}/-',
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge
//                                                     ?.copyWith(
//                                                       fontSize: 15,
//                                                       decoration: TextDecoration
//                                                           .lineThrough,
//                                                     ),
//                                               ),
//                                             Text(
//                                               state.products[index].price ==
//                                                       '\$0/-'
//                                                   ? 'Free'
//                                                   : '${state.products[index].price}/-',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyLarge
//                                                   ?.copyWith(fontSize: 16),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       } else if (state is InappNotAvailable) {
//                         return const Center(child: Text('Not Available'));
//                       }
//                       return const SizedBox();
//                     }),
//                   ),
//                   BlocBuilder<InappCubit, InappState>(
//                     builder: (context, state) {
//                       if (cubit.selectedProduct?.price != '\$0/-') {
//                         return Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: PayCheckBox(
//                             onChange: (bool value) {
//                               setState(() {
//                                 onlinePay = value;
//                               });
//                             },
//                           ),
//                         );
//                       } else {
//                         return const Offstage();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: SizedBox(
//           height: 126.h,
//           child: BottomAppBar(
//             color: Colors.black,
//             child: Center(
//               child: BlocBuilder<InappCubit, InappState>(
//                 builder: (context, state) {
//                   return Button(
//                     disable: cubit.selectedProduct == null,
//                     onTap: () {
//                       if (cubit.selectedProduct == null) {
//                         Alert(context).show(
//                           message:
//                               'Please select a membership plan to continue.',
//                         );
//                         return;
//                       } else if (cubit.selectedProduct?.price == '\$0/-') {
//                         cubit.addMemberShip(paymentMethod: null);
//                         return;
//                       }
//
//                       if (!onlinePay) {
//                         Navigator.pushNamed(context, SalesManPhone.route);
//                       }
//                       if (onlinePay) {
//                         context.read<InappCubit>().buy(cubit.selectedProduct!);
//                       }
//                     },
//                     title: cubit.selectedProduct?.price == '\$0/-'
//                         ? 'Try For Free'
//                         : 'Continue',
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
