import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: AppTextStyles.displayMedium(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.tertiary,
                  child: Text(
                    '${myAuthCubit.userName[0].toUpperCase()}',
                    style: AppTextStyles.displayMedium(context)
                        .copyWith(fontSize: 20.sp),
                  ),
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  '${myAuthCubit.userName.toUpperCase()}',
                  style: AppTextStyles.displayMedium(context)
                      .copyWith(fontSize: 20.sp),
                ),
                subtitle: Text(
                  '${myAuthCubit.userEmail}',
                  style: AppTextStyles.displayMedium(context)
                      .copyWith(fontSize: 16.sp, color: AppColors.tertiary),
                ),
              ),
              Divider(),
              Text(
                'General Settings',
                style: AppTextStyles.bodyLarge(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              ProfileListTile(
                leading: SvgPicture.asset(Assets.images.cart),
                title: 'My orders',
                trailling: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {
                  context.push('/my_orders');
                },
              ),
              ProfileListTile(
                leading: Icon(Icons.language),
                title: 'Language',
                trailling: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {},
              ),
              ProfileListTile(
                leading: Icon(Icons.sunny),
                title: 'Apperances',
                trailling: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {},
              ),
              ProfileListTile(
                leading: SvgPicture.asset(Assets.images.favouriteSvgrepoCom),
                title: 'Wishlist',
                trailling: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {
                  context.push('/favourite', extra: true);
                },
              ),
              Divider(),
              ProfileListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.redAccent,
                ),
                title: 'Log out',
                trailling: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () async {
                  await context.read<AuthCubit>().signOut();
                  context.pushReplacement('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.trailling,
    required this.onTap,
  });
  final Widget leading;
  final String title;
  final Widget trailling;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: leading,
            title: Text(
              title,
              style: AppTextStyles.displaySmall(context)
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal),
            ),
            trailing: trailling,
          ),
        ],
      ),
    );
  }
}
