import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/widgets/custom_app_bar.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:electronics_shop/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: 'Settings',
          showActionButton: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: AppTextStyles.labelLarge(context),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SettingsListTile(
                      leadingIcon: Ionicons.person_circle_outline,
                      title: 'Profile',
                      traillingIcon: Icons.keyboard_arrow_right_outlined,
                      onTap: () {
                        context.push('/profile_view');
                      },
                    ),
                    SettingsListTile(
                      leadingIcon: Icons.delivery_dining_rounded,
                      title: 'Orders',
                      traillingIcon: Icons.keyboard_arrow_right_outlined,
                      onTap: () {},
                    ),
                    SettingsListTile(
                      leadingIcon: Icons.favorite_border,
                      title: 'Whishing List',
                      traillingIcon: Icons.keyboard_arrow_right_outlined,
                      onTap: () {
                        context.push('/favourite');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More',
                      style: AppTextStyles.labelLarge(context),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SettingsListTile(
                      title: 'Contact Us',
                      leadingIcon: Icons.contact_support_outlined,
                      traillingIcon: Icons.keyboard_arrow_right_outlined,
                      onTap: () async {
                        final phoneNumber = '01551361200';
                        final url = Uri.parse('https://wa.me/$phoneNumber');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Handle error if WhatsApp not installed or can't open
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Could not open WhatsApp')),
                          );
                        }
                      },
                    ),
                    SettingsListTile(
                      title: 'Policy',
                      leadingIcon: Icons.policy_outlined,
                      traillingIcon: Icons.keyboard_arrow_right_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          icon: Icons.logout,
          label: 'Sign Out',
          backgroundColor: Colors.redAccent,
          onTap: () {
            context.read<AuthCubit>().signOut();
            MyToast.showMyToast(context,
                icon: Icons.logout, title: "logeed out", bgColor: Colors.green);
          },
        ),
      ),
    );
  }
}
