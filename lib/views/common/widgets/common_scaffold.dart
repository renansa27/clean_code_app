import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tut_project/views/resources/animation_assets_manager.dart';
import 'package:tut_project/views/resources/color_manager.dart';

class CommonScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? isLoading;
  final Widget body;
  final bool useWebConstraints;
  final bool? resizeToAvoidBottomInset;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final bool extendBody;
  final bool avoidBottomOnSafeArea;
  final Widget? bgImage;

  const CommonScaffold({
    Key? key,
    this.appBar,
    this.isLoading = false,
    required this.body,
    this.useWebConstraints = true,
    this.backgroundColor = ColorManager.white,
    this.resizeToAvoidBottomInset,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.extendBody = false,
    this.avoidBottomOnSafeArea = true,
    this.bgImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      body: _buildBody(),
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
    );
  }

  Widget _buildBody() {
    return SafeArea(
      bottom: avoidBottomOnSafeArea,
      child: Stack(
        children: [
          if (bgImage != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: bgImage!,
            ),
          body,
          if (isLoading!)
            Container(
              color: ColorManager.arsenic.withOpacity(0.5),
              child: Center(
                child: LottieBuilder.asset(
                    AnimationAssetsManager.loadingAnimation),
              ),
            ),
        ],
      ),
    );
  }
}
