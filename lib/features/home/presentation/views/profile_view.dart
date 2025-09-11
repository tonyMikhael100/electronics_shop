import 'package:electronics_shop/core/localization/cubit/localization_cubit.dart';
import 'package:electronics_shop/core/localization/widgets/language_selection_dialog.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/core/utils/my_toast.dart';
import 'package:electronics_shop/features/auth/presentation/view%20model/cubit/auth_cubit.dart';
import 'package:electronics_shop/gen/assets.gen.dart';
import 'package:electronics_shop/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final myAuthCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        final localizationCubit = context.read<LocalizationCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.profile,
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
                          .copyWith(fontSize: 18.sp),
                    ),
                    subtitle: Text(
                      '${myAuthCubit.userEmail}',
                      style: AppTextStyles.displayMedium(context)
                          .copyWith(fontSize: 16.sp, color: AppColors.tertiary),
                    ),
                  ),
                  Divider(),
                  Text(
                    AppLocalizations.of(context)!.generalSettings,
                    style: AppTextStyles.bodyLarge(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ProfileListTile(
                    leading: SvgPicture.asset(Assets.images.cart),
                    title: AppLocalizations.of(context)!.myOrders,
                    trailling: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      context.push('/my_orders');
                    },
                  ),
                  BlocBuilder<LocalizationCubit, LocalizationState>(
                    builder: (context, state) {
                      final localizationCubit =
                          context.read<LocalizationCubit>();
                      final l10n = AppLocalizations.of(context)!;
                      return ProfileListTile(
                        leading: Icon(Icons.language),
                        title: l10n.language,
                        trailling: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              localizationCubit.isArabic
                                  ? l10n.arabic
                                  : l10n.english,
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                color: AppColors.tertiary,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.keyboard_arrow_right_rounded),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const LanguageSelectionDialog(),
                          );
                        },
                      );
                    },
                  ),
                  ProfileListTile(
                    leading:
                        SvgPicture.asset(Assets.images.favouriteSvgrepoCom),
                    title: AppLocalizations.of(context)!.wishlist,
                    trailling: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      context.push('/favourite', extra: true);
                    },
                  ),
                  ProfileListTile(
                    leading: Icon(Icons.message_rounded),
                    title: AppLocalizations.of(context)!.contactUs,
                    trailling: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () async {
                      final Uri whatsappUrl =
                          Uri.parse("https://wa.me/96566014467?text=Hello");
                      if (!await launchUrl(whatsappUrl,
                          mode: LaunchMode.externalApplication)) {
                        debugPrint('Could not open WhatsApp');
                        MyToast.showMyToast(
                          context,
                          icon: Icons.error,
                          title: 'Could not open WhatsApp',
                          bgColor: Colors.redAccent,
                        );
                      }
                    },
                  ),
                  Divider(),
                  ProfileListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: Colors.redAccent,
                    ),
                    title: AppLocalizations.of(context)!.logOut,
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
      },
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
