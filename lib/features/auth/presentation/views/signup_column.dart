import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/data/models/user_model.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:electronics_shop/widgets/custom_Text_form_field.dart';
import 'package:electronics_shop/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class SignupColumn extends StatelessWidget {
  SignupColumn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNamaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.createNewAccount,
            style: AppTextStyles.displayMedium(context)
                .copyWith(color: AppColors.accent),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: l10n.fullName,
            onChanged: (value) {
              fullNamaController.text = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.fullNameRequired;
              } else if (value.trim().length < 3) {
                return l10n.fullNameMinLength;
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: l10n.phone,
            onChanged: (value) {
              phoneController.text = value;
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.phoneRequired;
              }
              if (!RegExp(r'^\d{10,15}$').hasMatch(value.trim())) {
                return l10n.phoneMinLength;
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            labelText: l10n.email,
            suffixIcon: Ionicons.mail_outline,
            onChanged: (value) {
              emailController.text = value;
            },
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
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            obscureText: true,
            labelText: l10n.password,
            suffixIcon: Ionicons.lock_closed_outline,
            onChanged: (value) {
              passwordController.text = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.passwordRequired;
              }
              if (value.length < 6) {
                return l10n.passwordMinLength;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 32),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailureState) {
                MyToast.showMyToast(
                  context,
                  bgColor: Colors.redAccent,
                  icon: Icons.error,
                  title: state.errorMessage,
                );
              }
              if (state is AuthSuccessState) {
                MyToast.showMyToast(
                  context,
                  icon: Icons.done,
                  title: state.successMessage,
                  bgColor: AppColors.accent,
                );
                context.go('/');
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return CustomLoginButton(
                  backgroundColor: Colors.grey,
                  label: l10n.loading,
                  onPressed: () {},
                );
              }
              return CustomLoginButton(
                backgroundColor: AppColors.accent,
                label: l10n.signUp,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).signUp(
                        userModel: UserModel(
                            fullName: fullNamaController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text));
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
