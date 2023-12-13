///-------------------- Common --------------------
export 'app/common/constants.dart';

///Storage
export 'app/common/storage/storage.dart';

///Values
export 'app/common/values/app_colors.dart';
export 'app/common/values/app_images.dart';
export 'app/common/values/strings.dart';

///Utils
export 'app/common/util/initializer.dart';
export 'app/common/util/utils.dart';
export 'app/common/util/store.dart';
export 'app/common/util/extensions.dart';

///-------------------- Data --------------------
export 'app/data/api_helper.dart';
export 'app/data/api_helper_impl.dart';
export 'app/data/api_response.dart';

///Errors
export 'app/data/errors/api_errors.dart';

///InterFace controller
export 'app/data/interface_controller/api_interface_controller.dart';

///Models
export 'app/data/models/onboarding_info.dart';
export 'app/data/models/privacy_first_model.dart';
export 'app/data/models/start_my_journey_model.dart';
export 'app/data/models/phone_parse_model.dart';
export 'app/data/models/token_response.dart';
export 'app/data/models/offline_instruction_model.dart';

///Api Response Model
export 'app/data/models/api_response_model/user_model.dart';
export 'app/data/models/api_response_model/article_model.dart';
export 'app/data/models/api_response_model/category_model.dart';

///Request Models
export 'app/data/models/request_models/registration_request.dart';
export 'app/data/models/request_models/login_request.dart';
export 'app/data/models/request_models/help_us_request.dart';
export 'app/data/models/request_models/update_password_request.dart';

///-------------------- Libraries --------------------
export 'package:flutter/foundation.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart';
export 'dart:math';
export 'dart:async';
export 'package:flutter_svg/svg.dart';
export 'package:google_fonts/google_fonts.dart';
export 'dart:io' hide HeaderValue;
export 'dart:ui'
    hide clampDouble
    hide decodeImageFromList
    hide TextStyle
    hide ImageDecoderCallback
    hide Codec
    hide Gradient
    hide Image
    hide StrutStyle;
export 'package:country_pickers/country.dart';
export 'package:country_pickers/country_pickers.dart';
export 'package:phone_number/phone_number.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:drop_shadow/drop_shadow.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:convert';
export 'package:shimmer/shimmer.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

///-------------------- Routes --------------------
export 'app/routes/app_pages.dart';

///-------------------- Modules --------------------
///Widgets
export 'app/modules/widgets/blur_box.dart';
export 'app/modules/widgets/exit_dialog.dart';
export 'app/modules/widgets/custom_button.dart';
export 'app/modules/widgets/text_input_field.dart';
export 'app/modules/widgets/ios_back_button.dart';
export 'app/modules/widgets/library_card.dart';
export 'app/modules/widgets/article_points.dart';
export 'app/modules/widgets/article_summary.dart';
export 'app/modules/widgets/reviewed_by_doctor.dart';
export 'app/modules/widgets/coming_soon.dart';
export 'app/modules/widgets/offline_widget.dart';

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
export 'app/modules/reset_password/views/proceed_to_login.dart';

/// Help Us
export 'app/modules/help_us/bindings/help_us_binding.dart';
export 'app/modules/help_us/controllers/help_us_controller.dart';
export 'app/modules/help_us/views/help_us_view.dart';
export 'app/modules/help_us/views/request_sent_view.dart';

///Landing Page
export 'app/modules/landing_screen/controllers/landing_screen_controller.dart';
export 'app/modules/landing_screen/bindings/landing_binding.dart';
export 'app/modules/landing_screen/views/landing_screen.dart';

///Library
export 'app/modules/library/bindings/library_bindings.dart';
export 'app/modules/library/controllers/library_controllers.dart';
export 'app/modules/library/views/library_views.dart';

///progress
export 'app/modules/progress/controllers/progress_controller.dart';
export 'app/modules/progress/bindings/progress_binding.dart';
export 'app/modules/progress/views/progress_view.dart';

///Check In
export 'app/modules/checkin/controllers/checkin_controller.dart';
export 'app/modules/checkin/bindings/checkin_binding.dart';
export 'app/modules/checkin/views/checkin_view.dart';

///Learn
export 'app/modules/learn/controllers/learn_controller.dart';
export 'app/modules/learn/bindings/learn_binding.dart';
export 'app/modules/learn/views/learn_view.dart';

///More
export 'app/modules/more/controllers/more_controller.dart';
export 'app/modules/more/bindings/more_binding.dart';
export 'app/modules/more/views/more_view.dart';

///Article Template 1
export 'app/modules/article_template1/controller/article_template1_controller.dart';
export 'app/modules/article_template1/bindings/article_template1_bindings.dart';
export 'app/modules/article_template1/views/article_template1.view.dart';

///Article Template 2
export 'app/modules/article_template2/controller/article_template2_controller.dart';
export 'app/modules/article_template2/bindings/article_template2_bindings.dart';
export 'app/modules/article_template2/views/article_template2.view.dart';

// ///Coming Soon
// export 'app/modules/coming_soon/controllers/coming_soon_controller.dart';
// export 'app/modules/coming_soon/bindings/coming_soon_binding.dart';
// export 'app/modules/coming_soon/views/coming_soon_views.dart';
