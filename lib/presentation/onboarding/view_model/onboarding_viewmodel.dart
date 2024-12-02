import 'dart:async';

import 'package:weather_now/domain/models.dart';
import 'package:weather_now/presentation/base/base_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // stream controllers for output
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentPageIndex = 0;

  // Onboarding ViewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    _postDataToView();
  }

  @override
  int goNextSlide() {
    int nextIndex = _currentPageIndex + 1;
    if (nextIndex >= _list.length) {
      nextIndex = 0; // Wrap around to the first item
    }
    return nextIndex;
  }

  @override
  int goPreviousSlide() {
    int previousIndex = _currentPageIndex - 1;
    if (previousIndex < 0) {
      previousIndex = _list.length - 1; // Wrap around to the last item
    }
    return previousIndex;
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // Onboarding View Model Outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        _list[_currentPageIndex], _list.length, _currentPageIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onboardingTitle1,
          AppStrings.onboardingSubtitle1,
          ImageAssets.onboardingScreenLogo1,
        ),
        SliderObject(
          AppStrings.onboardingTitle2,
          AppStrings.onboardingSubtitle2,
          ImageAssets.onboardingScreenLogo2,
        ),
        SliderObject(
          AppStrings.onboardingTitle3,
          AppStrings.onboardingSubtitle3,
          ImageAssets.onboardingScreenLogo3,
        ),
        SliderObject(
          AppStrings.onboardingTitle4,
          AppStrings.onboardingSubtitle4,
          ImageAssets.onboardingScreenLogo4,
        ),
      ];
}

// inputs mean that "orders" that our view model will receive from view
mixin OnboardingViewModelInputs {
  void goNextSlide(); // when user clicks on right arrow or swipe left
  void goPreviousSlide(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);
  // stream controller input
  Sink get inputSliderViewObject;
}

mixin OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
