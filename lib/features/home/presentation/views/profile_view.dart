import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/widgets/custom_Text_form_field.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<dynamic> data = [];

  void getUserData() async {
    final result = await context.read<AuthCubit>().getUserData();
    setState(() {
      data = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: 'Profile',
          showActionButton: false,
        ),
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/images/profile.svg',
                            width: 150.w,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(
                            data[0]['name'],
                            style: AppTextStyles.labelLarge(context),
                          ),
                          subtitle: Text(
                            data[0]['email'],
                            style: AppTextStyles.titleMedium(context)
                                .copyWith(color: Colors.black45),
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.black12),
                        SizedBox(height: 10),
                        buildProfileRow('Name', data[0]['name']),
                        buildProfileRow('Email', data[0]['email']),
                        buildProfileRow('Phone', data[0]['phone']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildProfileRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.labelLarge(context)),
          Text(value,
              style: AppTextStyles.labelLarge(context)
                  .copyWith(color: Colors.black45)),
        ],
      ),
    );
  }
}
