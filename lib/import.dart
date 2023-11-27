export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:convert';

///Values
export 'app/common/values/app_colors.dart';
export 'app/common/values/app_images.dart';
export 'app/common/values/strings.dart';

///Utils
export 'app/common/util/initializer.dart';
export 'app/common/util/utils.dart';
export 'app/common/storage/storage.dart';
export 'app/common/util/store.dart';


///Widgets

///Libraries
export 'package:flutter/foundation.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart';
export 'dart:math';
export 'dart:async';
export 'package:flutter_svg/svg.dart';
export 'package:google_fonts/google_fonts.dart';
export 'dart:io' hide HeaderValue;
export 'dart:ui'  hide clampDouble hide decodeImageFromList hide TextStyle hide ImageDecoderCallback hide Codec hide Gradient hide Image hide StrutStyle;
export 'package:country_pickers/country.dart';
export 'package:country_pickers/country_pickers.dart';
export 'package:phone_number/phone_number.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:drop_shadow/drop_shadow.dart';

/// Strings

/// Colors

///Widgets
export 'app/modules/widgets/blur_box.dart';
export 'app/modules/widgets/exit_dialog.dart';
export 'app/modules/widgets/custom_button.dart';
export 'app/modules/widgets/text_input_field.dart';



/// App Pages
export 'app/routes/app_pages.dart';

///Models
export 'app/data/models/onboarding_info.dart';
export 'app/data/models/privacy_first_model.dart';
export 'app/data/models/start_my_journey_model.dart';
export 'app/data/models/phone_parse_model.dart';


/// Home Screen
export 'app/modules/home/bindings/home_binding.dart';
export 'app/modules/home/controllers/home_controller.dart';
export 'app/modules/home/views/home_view.dart';

/// Splash Screen
export 'app/modules/splash/bindings/splash_binding.dart';
export 'app/modules/splash/controllers/splash_controller.dart';
export 'app/modules/splash/views/splash_view.dart';

/// onBoarding Screen
export 'app/modules/on_boarding/bindings/on_boarding_binding.dart';
export 'app/modules/on_boarding/controllers/on_boarding_controller.dart';
export 'app/modules/on_boarding/views/on_boarding_view.dart';

/// Welcome Screen
export 'app/modules/welcome_screen/bindings/welcome_binding.dart';
export 'app/modules/welcome_screen/controllers/welcome_controller.dart';
export 'app/modules/welcome_screen/views/welcome_view.dart';

/// Sign In Screen
export 'app/modules/sign_in/bindings/sign_in_binding.dart';
export 'app/modules/sign_in/controllers/sign_in_controller.dart';
export 'app/modules/sign_in/views/sign_in_view.dart';

/// Sign Up Screen
export 'app/modules/sign_up/bindings/sign_up_binding.dart';
export 'app/modules/sign_up/controllers/sign_up_controller.dart';
export 'app/modules/sign_up/views/sign_up_view.dart';
export 'app/modules/sign_up/views/complete_profile.dart';

/// Privacy First Screen
export 'app/modules/privacy_page/bindings/privacy_first_binding.dart';
export 'app/modules/privacy_page/controllers/privacy_first_controller.dart';
export 'app/modules/privacy_page/views/privacy_first_view.dart';

/// Start My Journey
export 'app/modules/start_my_journey/bindings/start_my_journey_binding.dart';
export 'app/modules/start_my_journey/controllers/start_my_journey_controller.dart';
export 'app/modules/start_my_journey/views/start_my_journey_view.dart';

/// Reset Password
export 'app/modules/reset_password/bindings/reset_password_binding.dart';
export 'app/modules/reset_password/controllers/reset_password_controller.dart';
export 'app/modules/reset_password/views/reset_password_view.dart';
export 'app/modules/reset_password/views/update_password_view.dart';