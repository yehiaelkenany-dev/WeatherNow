import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:weather_now/presentation/resources/assets_manager.dart';
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
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
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

  @override
  Widget build(BuildContext context) {
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
          return OnBoardingPage(_list[index]);
        },
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
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
            Expanded(child: _getBottomSheetWidget())
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
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
                  _getPreviousIndex(),
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
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.p8,
                  ),
                  child: _getProperCircleIcon(i),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: AppPadding.p2, right: AppPadding.p2),
            child: IconButton(
              onPressed: () {
                _pageController.animateToPage(
                  _getNextIndex(),
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

  int _getPreviousIndex() {
    int previousIndex = _currentPageIndex - 1;
    if (previousIndex < 0) {
      previousIndex = _list.length - 1; // Wrap around to the last item
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentPageIndex + 1;
    if (nextIndex >= _list.length) {
      nextIndex = 0; // Wrap around to the first item
    }
    return nextIndex;
  }

  Widget _getProperCircleIcon(int index) {
    if (index == _currentPageIndex) {
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

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
