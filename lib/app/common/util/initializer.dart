import 'package:get_storage/get_storage.dart';
import '../../../import.dart';

abstract class Initializer {
  static void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> _initServices() async {
    try {
      await _initStorage();

      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<ApiHelper>(ApiHelperImpl());

    Get.lazyPut<ApiHelper>(
      () => ApiHelperImpl(),
    );

    Get.lazyPut<ApiInterfaceController>(
      () => ApiInterfaceController(),
    );
  }
}
