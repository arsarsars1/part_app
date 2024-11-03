import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:part_app/constants/constant.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/view/account/switch_account.dart';
import 'package:part_app/view/components/cached_image.dart';
import 'package:part_app/view/home/components/logout.dart';
import 'package:part_app/view/profile/trainer_app_profile.dart';
import 'package:part_app/view_model/authentication/auth_cubit.dart';
import 'package:part_app/view_model/profile_pic/cubit/profile_cubit.dart';

// enum MenuItems { profile, account, logout, membership, switchAccount }
enum MenuItems { profile, logout, switchAccount }

class TrainerProfileButton extends StatefulWidget {
  const TrainerProfileButton({super.key});

  @override
  State<TrainerProfileButton> createState() => _TrainerProfileButtonState();
}

class _TrainerProfileButtonState extends State<TrainerProfileButton> {
  @override
  Widget build(BuildContext context) {
    User? user = context.read<AuthCubit>().user;
    var authCubit = context.read<AuthCubit>();
    return PopupMenuButton<MenuItems>(
      onSelected: (MenuItems item) {
        switch (item) {
          case MenuItems.profile:
            Navigator.pushNamed(context, TrainerAppProfile.route);
            break;
          // case MenuItems.account:
          //   Navigator.pushNamed(context, TrainerAccount.route);
          //   break;
          case MenuItems.logout:
            Logout(context).show();
            break;
          // case MenuItems.membership:
          //   Navigator.pushNamed(context, CurrentMembership.route);
          //   break;
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
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var url = '';
            if (state is ProfileInitial) {
              url = user?.trainerDetail?[authCubit.trainerIndex].profilePic !=
                      ""
                  ? '${F.baseUrl}/trainers/${authCubit.user?.trainerDetail?[authCubit.trainerIndex].id}/images/profile-pic/${authCubit.user?.trainerDetail?.first.profilePic}'
                  : user?.trainerDetail?[authCubit.trainerIndex].gender ==
                          "male"
                      ? "https://v1.partapp.in/images/avatars/avatar-5.png"
                      : "https://v1.partapp.in/images/avatars/avatar-1.png";
            } else if (state is ProfileLoaded) {
              url =
                  '${F.baseUrl}/trainers/${authCubit.user?.trainerDetail?[authCubit.trainerIndex].id}/images/profile-pic/${state.profilePic}';
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedImage(url).image(),
            );
          },
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
          // PopupMenuItem(
          //   height: 14,
          //   value: MenuItems.account,
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          //   child: Text(
          //     'Account',
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
          PopupMenuItem(
            height: 14,
            value: MenuItems.switchAccount,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Switch Account',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          // PopupMenuItem(
          //   height: 14,
          //   value: MenuItems.membership,
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          //   child: Text(
          //     'Membership',
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
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
