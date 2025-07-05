import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/widgets/custom_Text_form_field.dart';
import 'package:electronics_shop/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class LoginColumn extends StatelessWidget {
  LoginColumn({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailuregState) {
          MyToast.showMyToast(context,
              bgColor: Colors.redAccent,
              icon: Icons.error,
              title: state.errorMessage);
        } else {
          MyToast.showMyToast(context,
              icon: Icons.done, title: 'Login', bgColor: Colors.green);
          context.go('/home_view');
        }
      },
      child: Form(
        key: formKey,
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
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value.trim())) {
                  return 'Enter a valid email';
                }
                return null;
              },
              onChanged: (value) {
                emailController.text = value;
              },
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              obscureText: true,
              labelText: 'Password',
              suffixIcon: Ionicons.lock_closed_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            SizedBox(height: 32),
            CustomLoginButton(
              label: 'Login',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).signIn(
                      email: emailController.text,
                      password: passwordController.text);
                }
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
      ),
    );
  }
}
