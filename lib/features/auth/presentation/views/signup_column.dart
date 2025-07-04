import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/features/auth/data/repo/auth_repo_imp.dart';
import 'package:electronics_shop/widgets/custom_Text_form_field.dart';
import 'package:electronics_shop/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SignupColumn extends StatelessWidget {
  SignupColumn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Malak El5alig',
              style: AppTextStyles.displayLarge(context)
                  .copyWith(color: AppColors.primaryColor)),
          SizedBox(height: 40),
          Text('Hello there!',
              style: AppTextStyles.displayMedium(context).copyWith()),
          SizedBox(height: 8),
          Text(
            'Create a new account',
            style: AppTextStyles.bodyMedium(context)
                .copyWith(color: Colors.black45),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: 'Full Name',
            onChanged: (value) {},
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            labelText: 'Email',
            suffixIcon: Ionicons.mail_outline,
            onChanged: (value) {
              emailController.text = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            obscureText: true,
            labelText: 'Password',
            suffixIcon: Ionicons.lock_closed_outline,
            onChanged: (value) {
              passwordController.text = value;
            },
          ),
          SizedBox(height: 32),
          CustomLoginButton(
            label: 'SignUp',
            onPressed: () async {
              // if (formKey.currentState!.validate()) {
              // }
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or SignUp with',
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(color: Colors.black54),
                ),
              ),
              Expanded(child: Divider(thickness: 1)),
            ],
          ),
          SizedBox(height: 24),
          CustomLoginButton(
            backgroundColor: Colors.white,
            labelColor: Colors.black,
            label: 'SignUp with Google',
            icon: Icon(
              Ionicons.logo_google,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              // Handle Google signup action
            },
          ),
        ],
      ),
    );
  }
}
