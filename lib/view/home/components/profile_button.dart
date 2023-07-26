import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/constants/constant.dart';
import 'package:part_app/view/home/components/logout.dart';
import 'package:part_app/view/membership/current_membership.dart';
import 'package:part_app/view/profile/profile.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';

enum MenuItems { profile, logout, membership, switchAccount }

class ProfileButton extends StatefulWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    User? user = context.read<AuthCubit>().user;
    return PopupMenuButton<MenuItems>(
      onSelected: (MenuItems item) {
        switch (item) {
          case MenuItems.profile:
            Navigator.pushNamed(context, Profile.route);
            break;
          case MenuItems.logout:
            Logout(context).show();
            break;
          case MenuItems.membership:
            Navigator.pushNamed(context, CurrentMembership.route);
            break;
          case MenuItems.switchAccount:
            Navigator.pushNamed(context, SwitchAccount.route);
            break;
        }
        setState(() {});
      },
      splashRadius: 0,
      color: AppColors.liteDark,
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(maxWidth: 127.w),
      child: Container(
        height: 36.r,
        width: 36.r,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            user?.adminDetail?.gender == "male"
                ? "https://dev.partapp.in/images/avatars/avatar-5.png"
                : "https://dev.partapp.in/images/avatars/avatar-1.png",
          ),
        ),
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry<MenuItems>>[
          PopupMenuItem(
            value: MenuItems.profile,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            height: 14,
            child: Text(
              'View Profile',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          PopupMenuItem(
            height: 14,
            value: MenuItems.switchAccount,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Switch Account',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          PopupMenuItem(
            height: 14,
            value: MenuItems.membership,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Membership',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          PopupMenuItem(
            height: 14,
            value: MenuItems.logout,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ];
      },
    );
  }
}
