import 'package:electronics_shop/core/app_colors.dart';
import 'package:electronics_shop/core/app_styles.dart';
import 'package:electronics_shop/core/my_toast.dart';
import 'package:electronics_shop/widgets/custom_Text_form_field.dart';
import 'package:electronics_shop/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:toastification/toastification.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Malak El5alig',
              style: AppTextStyles.displayLarge(context)
                  .copyWith(color: AppColors.primaryColor)),
          SizedBox(height: 40),
          Text('Welcome Back',
              style: AppTextStyles.displayMedium(context).copyWith()),
          SizedBox(height: 8),
          Text(
            'please lgin to your account',
            style: AppTextStyles.bodyMedium(context)
                .copyWith(color: Colors.black45),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: 'Email',
            suffixIcon: Ionicons.mail_outline,
            validator: (value) {
              return 'bla bla';
            },
            onChanged: (value) {},
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            obscureText: true,
            labelText: 'Password',
            suffixIcon: Ionicons.lock_closed_outline,
            validator: (value) {
              return 'bla bla';
            },
            onChanged: (value) {},
          ),
          SizedBox(height: 32),
          CustomLoginButton(
            label: 'Login',
            onPressed: () {
              context.go('/home_view');
              MyToast.showMyToast(context,
                  icon: Icons.handshake_outlined,
                  title: 'Welcome back !',
                  bgColor: Colors.green);
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or login with',
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
            label: 'Login with Google',
            icon: Icon(
              Ionicons.logo_google,
              color: AppColors.primaryColor,
            ),
            onPressed: () {},
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: AppTextStyles.bodyMedium(context)
                    .copyWith(color: Colors.black54),
              ),
              TextButton(
                onPressed: () {
                  context.push('/signup');
                },
                child: Text(
                  'Sign Up',
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
