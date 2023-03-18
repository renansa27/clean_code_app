import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/views/base/onboarding_view_model.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/color_manager.dart';
import 'package:tut_project/views/resources/routes_manager.dart';
import 'package:tut_project/views/resources/strings_manager.dart';
import 'package:tut_project/views/resources/values_manager.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderView,
      builder: (context, snapShot) {
        return _getContentWidget(snapShot.data);
      },
    );
    //return _getContentWidget();
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSliders,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
            /* setState(() {
              sliderViewObject.currentIndex = index;
            }); */
          },
          itemBuilder: (context, index) {
            // return OnboardingPage
            return _OnboardingWidget(
              slider: sliderViewObject.slider,
            );
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    await Navigator.pushReplacementNamed(
                        context, Routes.loginRoute);
                  },
                  child: Text(
                    StringsManager.skip,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return DecoratedBox(
      decoration: BoxDecoration(color: ColorManager.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                //go to the previous slide
                _pageController.animateToPage(
                  _viewModel.goPrevious(),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
              child: SvgPicture.asset(SvgAssets.leftArrow),
            ),
          ),
          //Circles indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < sliderViewObject.numberOfSliders; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(
                      index: i, currentIndex: sliderViewObject.currentIndex),
                ),
            ],
          ),
          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                //go to the next slide
                _pageController.animateToPage(
                  _viewModel.goNext(),
                  duration: const Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
              child: SvgPicture.asset(SvgAssets.rightArrow),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle({required int index, required int currentIndex}) {
    if (index == currentIndex) {
      return SvgPicture.asset(SvgAssets.unfilledCircle);
    } else {
      return SvgPicture.asset(SvgAssets.solidCircle);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class _OnboardingWidget extends StatelessWidget {
  const _OnboardingWidget({
    Key? key,
    required SliderObject slider,
  })  : _slider = slider,
        super(key: key);

  final SliderObject _slider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        // Title text
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _slider.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: AppSize.s40),
        // Subtitle text
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _slider.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s20),
        // Image Widget
        SvgPicture.asset(_slider.image),
      ],
    );
  }
}
