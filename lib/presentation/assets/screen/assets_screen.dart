import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/presentation/shared_components/default_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../../logic/cubit/assets/assets_cubit.dart';
import '../../router/app_router.dart';
import '../../shared_components/default_gradient_button.dart';
import '../../shared_components/gradient_background_container.dart';
import '../../shared_components/loading_widget.dart';
import '../widgets/assets_change_chart_button.dart';
import '../widgets/assets_chart_widget.dart';
import '../widgets/assets_header_widget.dart';
import '../widgets/assets_total_widget.dart';
import '../widgets/miners_gains_widget.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      await context.read<AssetsCubit>().getUserData();
      await context.read<AssetsCubit>().getUserBalance();
      await context.read<AssetsCubit>().getAllChartData();
      _refreshController.refreshCompleted();
    }

    return BlocListener<AssetsCubit, AssetsState>(
      listener: (context, state) {
        if (state is UnauthorizedAssetsState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: AlertDialog(
                  title: const Text('Session expired'),
                  content: const Text(Strings.loginSessionError),
                  actions: [
                    TextButton(
                      child: const Text("Login"),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRouter.firstLogin);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is AssetsGetUserDataErrorState) {
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        } else if (state is AssetsGetPlanContractErrorState) {
          defaultToast(
            text: state.errorMessage,
            isError: true,
          );
        }
      },
      child: Stack(
        children: [
          const GradientBackgroundContainer(),
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropMaterialHeader(
              backgroundColor: const Color(0xffFF4980).withOpacity(0.8),
            ),
            onRefresh: _onRefresh,
            child: FutureBuilder(
              future: context.read<AssetsCubit>().getUserData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AssetsHeaderWidget(),
                          SizedBox(
                            height: (1.h),
                          ),
                          const AssetsTotalWidget(),
                          SizedBox(height: (5.h)),
                          Text(
                            'Hashrate Profits',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: (22.sp),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(height: (1.h)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: (4.w)),
                            width: double.infinity,
                            height: (8.h),
                            decoration: const BoxDecoration(
                              color: Color(0xff1d1a27),
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Last Profits',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: (14.sp),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Container(
                                  width: (10.w),
                                  height: (10.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular((40)),
                                    color: const Color(0xff302c3f),
                                  ),
                                  child: SvgPicture.asset(
                                    Strings.filterIcon,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const AssetsChangeChartButton(),
                          const AssetsChartWidget(),
                          Container(
                            height: 10.h,
                            color: const Color(0xff1d1a27),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: DefaultGradientButton(
                              isFilled: false,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'See mining devices',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: (12.sp),
                                          fontWeight: FontWeight.bold,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 2.h,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.buyMiningDevice);
                              },
                            ),
                          ),
                          SizedBox(
                            height: (5.h),
                          ),
                          Text(
                            'Miners Gains',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: (22.sp),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: (2.h),
                          ),
                          const MinersGainsWidget(),
                        ],
                      ),
                    ),
                  );
                }
                return const LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
