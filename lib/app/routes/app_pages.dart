import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;
  //Routes.splash;

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
    ),
    GetPage(
      name: _Paths.resetPassword,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.updatePassword,
      page: () => UpdatePasswordView(),
    ),
    GetPage(
      name: _Paths.processToLogin,
      page: () => ProcessToLoginView(),
    ),
    GetPage(
      name: _Paths.helpUs,
      page: () => HelpUsView(),
      binding: HelpUsBinding(),
    ),
    GetPage(
      name: _Paths.requestSubmitted,
      page: () => RequestSubmittedView(),
    ),
    GetPage(
      name: _Paths.library,
      page: () => const LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.articleTemplate1,
      page: () => const ArticleTemplateView1(),
      binding: ArticleTemplate1Binding(),
    ),
    GetPage(
      name: _Paths.articleTemplate2,
      page: () => const ArticleTemplateView2(),
      binding: ArticleTemplate2Binding(),
    ),
    GetPage(
      name: _Paths.progress,
      page: () => ProgressView(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: _Paths.checkin,
      page: () => CheckinView(),
      binding: CheckinBinding(),
    ),
    GetPage(
      name: _Paths.learn,
      page: () => LearnView(),
      binding: LearnBinding(),
    ),
    GetPage(
      name: _Paths.more,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.landingPage,
      page: () => LandingScreen(),
      binding: LandingBinding(),
    ),
  ];
}
