import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:weather_now/domain/models.dart';
import 'package:weather_now/presentation/onboarding/view_model/onboarding_viewmodel.dart';
import 'package:weather_now/presentation/resources/color_manager.dart';
import 'package:weather_now/presentation/resources/constants_manager.dart';
import 'package:weather_now/presentation/resources/routes_manager.dart';
import 'package:weather_now/presentation/resources/strings_manager.dart';
import 'package:weather_now/presentation/resources/values_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final OnboardingViewModel _onboardingViewModel = OnboardingViewModel();

  _bind() {
    _onboardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onboardingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
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
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _onboardingViewModel.onPageChanged(index);
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.onboardingSkip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Expanded(child: _getBottomSheetWidget(sliderViewObject))
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left-arrow
          Padding(
            padding: const EdgeInsets.only(
                bottom: AppPadding.p2, left: AppPadding.p2),
            child: IconButton(
              onPressed: () {
                _pageController.animateToPage(
                  _onboardingViewModel.goPreviousSlide(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut,
                );
              },
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: ColorManager.white,
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: _getProperCircleIcon(i, sliderViewObject.currentIndex),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: AppPadding.p2, right: AppPadding.p2),
            child: IconButton(
              onPressed: () {
                _pageController.animateToPage(
                  _onboardingViewModel.goNextSlide(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut,
                );
              },
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircleIcon(int index, int currentPageIndex) {
    if (index == currentPageIndex) {
      return HugeIcon(
        icon: HugeIcons.strokeRoundedCircle,
        color: ColorManager.white,
        size: AppSize.s12,
      );
    } else {
      return Icon(
        Icons.circle,
        color: ColorManager.white,
        size: AppSize.s12,
      );
    }
  }

  @override
  void dispose() {
    _onboardingViewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        // const SizedBox(
        //   height: AppSize.s18,
        // ),
        Expanded(
            child: SvgPicture.asset(
          _sliderObject.image,
          alignment: Alignment.center,
          // height: DeviceUtils.getHeight(context) / 3.5,
        ))
      ],
    );
  }
}
