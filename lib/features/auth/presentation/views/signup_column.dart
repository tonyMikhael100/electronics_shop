import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/data/models/user_model.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          MyToast.showMyToast(context,
              bgColor: Colors.redAccent,
              icon: Icons.error,
              title: state.errorMessage);
        }
        if (state is AuthSuccessState) {
          MyToast.showMyToast(context,
              icon: Icons.error,
              title: state.successMessage,
              bgColor: AppColors.secondaryColor);
          context.go('/');
        }
      },
      builder: (context, state) {
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
                onChanged: (value) {
                  fullNamaController.text = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full Name is required';
                  } else if (value.trim().length < 3) {
                    return 'Full Name must be at least 3 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'Phone Number',
                onChanged: (value) {
                  phoneController.text = value;
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone Number is required';
                  }
                  if (!RegExp(r'^\d{10,15}$').hasMatch(value.trim())) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Email',
                suffixIcon: Ionicons.mail_outline,
                onChanged: (value) {
                  emailController.text = value;
                },
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
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                obscureText: true,
                labelText: 'Password',
                suffixIcon: Ionicons.lock_closed_outline,
                onChanged: (value) {
                  passwordController.text = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 32),
              CustomLoginButton(
                label: 'SignUp',
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
              ),
            ],
          ),
        );
      },
    );
  }
}
