import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebitcoiner/core/constants/colors.dart';
import 'package:ebitcoiner/data/models/logout_model.dart';
import 'package:ebitcoiner/logic/cubit/assets/assets_cubit.dart';
import 'package:ebitcoiner/presentation/profile/widgets/password_info_widget.dart';
import 'package:ebitcoiner/presentation/profile/widgets/personal_info_widget.dart';
import 'package:ebitcoiner/presentation/router/app_router.dart';
import 'package:ebitcoiner/presentation/shared_components/default_toast.dart';

import 'package:ebitcoiner/presentation/shared_components/gradient_background_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../shared_components/loading_dialog.dart';
import '../../shared_components/session_expired.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<AssetsCubit>().getUserData();
      _refreshController.refreshCompleted();
    }

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UnauthorizedProfileState) {
          sessionExpiredDialog(context: context);
        }
        if (state is DeleteSavedTokensSuccessState) {
          Navigator.of(context).pop();
          Navigator.of(context).popAndPushNamed(AppRouter.onboarding);
        } else if (state is DeleteSavedTokensLoadingState ||
            state is LogoutLoadingState) {
          loadingDialog(context: context);
        } else if (state is LogoutErrorState) {
          Navigator.of(context).pop();
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Stack(
        children: [
          const GradientBackgroundContainer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropMaterialHeader(
                backgroundColor: ColorManager.secondary.withOpacity(0.8),
              ),
              onRefresh: _onRefresh,
              child: Builder(builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      PersonalInfoWidget(
                        email: context.watch<AssetsCubit>().userData.email!,
                        phoneNum: context.watch<AssetsCubit>().userData.phone!,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const PasswordInfoWidget(password: ' ••••••••• '),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () async {
                          await context.read<ProfileCubit>().logout(
                                logoutModel: LogoutModel(
                                  refreshToken: await context
                                      .read<ProfileCubit>()
                                      .getSavedRefreshToken(),
                                ),
                              );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          height: (8.h),
                          color: ColorManager.primary,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout_outlined,
                                color: ColorManager.red,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      color: ColorManager.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
