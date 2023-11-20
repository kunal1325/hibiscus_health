import 'package:hibiscus_health/app/modules/sign_up/views/complete_profile.dart';

import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.landingScreen;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.onBoarding,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.welcomeScreen,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.privacyFirst,
      page: () => PrivacyFirstView(),
      binding: PrivacyFirstBinding(),
    ),
    GetPage(
      name: _Paths.startMyJourney,
      page: () => StartMyJourneyView(),
      binding: StartMyJourneyBinding(),
    ),
    GetPage(
      name: _Paths.completeProfile,
      page: () => CompleteProfileView(),
      binding: SignUpBinding(),
    ),
  ];
}
