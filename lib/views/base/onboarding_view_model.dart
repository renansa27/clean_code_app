import 'dart:async';

import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/views/base/base_view_model.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // Stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _sliderList;
  int _currentIndex = 0;

  // inputs
  @override
  Sink get inputSliderView => _streamController.sink;

  // outputs
  @override
  Stream<SliderViewObject> get outputSliderView =>
      _streamController.stream.map((sliderView) => sliderView);

  // It should be called on dispose slider view
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
    // send slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex + 1 == _sliderList.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == 0) {
      _currentIndex = _sliderList.length - 1;
    }

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  // Private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
          StringsManager.onboardingTitleOne,
          StringsManager.onboardingSubtitleOne,
          SvgAssets.onboardingOne,
        ),
        SliderObject(
          StringsManager.onboardingTitleTwo,
          StringsManager.onboardingSubtitleTwo,
          SvgAssets.onboardingTwo,
        ),
        SliderObject(
          StringsManager.onboardingTitleThree,
          StringsManager.onboardingSubtitleThree,
          SvgAssets.onboardingThree,
        ),
        SliderObject(
          StringsManager.onboardingTitleFour,
          StringsManager.onboardingSubtitleFour,
          SvgAssets.onboardingFour,
        ),
      ];

  _postDataToView() {
    inputSliderView.add(
      SliderViewObject(
        slider: _sliderList[_currentIndex],
        numberOfSliders: _sliderList.length,
        currentIndex: _currentIndex,
      ),
    );
  }
}

// Inputs mean the orders that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // When user clicks on right arrow or swipe left
  void goPrevious(); // When user clicks on left arrow or swipe right
  void onPageChanged(int index);
  Sink get inputSliderView; // This is the way to add data to stream obj
}

// Outputs mean data or results that will be sent from our view model to our view.
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderView;
}

class SliderViewObject {
  SliderObject slider;
  int numberOfSliders;
  int currentIndex;
  SliderViewObject({
    required this.slider,
    required this.numberOfSliders,
    required this.currentIndex,
  });
}
