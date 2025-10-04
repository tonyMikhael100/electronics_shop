import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.appTitle,
              style: AppTextStyles.displayLarge(context)
                  .copyWith(color: AppColors.accent)),
          SizedBox(height: 40),
          Text(l10n.welcomeBack,
              style: AppTextStyles.displayMedium(context).copyWith()),
          SizedBox(height: 8),
          Text(
            l10n.pleaseLoginToAccount,
            style: AppTextStyles.bodyMedium(context)
                .copyWith(color: Colors.black45),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: l10n.email,
            suffixIcon: Ionicons.mail_outline,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.emailRequired;
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value.trim())) {
                return l10n.invalidEmailFormat;
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
            labelText: l10n.password,
            suffixIcon: Ionicons.lock_closed_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.passwordRequired;
              }
              if (value.length < 6) {
                return l10n.passwordMinLength;
              }
              return null;
            },
            onChanged: (value) {
              passwordController.text = value;
            },
          ),
          SizedBox(height: 32),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginFailuregState) {
                MyToast.showMyToast(
                  context,
                  bgColor: Colors.redAccent,
                  icon: Icons.error,
                  title: state.errorMessage,
                );
              }
              if (state is LoginSuccessState) {
                MyToast.showMyToast(context,
                    icon: Icons.done,
                    title: l10n.loggedInSuccessfully,
                    bgColor: AppColors.accent);
                context.go('/');
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return CustomLoginButton(
                  backgroundColor: Colors.grey,
                  label: l10n.loading,
                  onPressed: () {},
                );
              }
              return CustomLoginButton(
                backgroundColor: AppColors.accent,
                label: l10n.login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).signIn(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
              );
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  l10n.orLoginWith,
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(color: Colors.black54),
                ),
              ),
              Expanded(child: Divider(thickness: 1)),
            ],
          ),
          SizedBox(height: 24),
          // Continue as Guest Button
          SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              context.go('/');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.accent),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  color: AppColors.accent,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Continue as Guest',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.dontHaveAccount,
                style: AppTextStyles.bodyMedium(context)
                    .copyWith(color: Colors.black54),
              ),
              TextButton(
                onPressed: () {
                  context.push('/signup');
                },
                child: Text(
                  l10n.signUp,
                  style: AppTextStyles.bodyMedium(context).copyWith(
                      color: AppColors.accent, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
