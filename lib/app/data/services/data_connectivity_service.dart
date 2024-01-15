import '../../../import.dart';

class DataConnectivityService {
  StreamController<DataConnectionStatus> connectivityStreamController =
      StreamController<DataConnectionStatus>();

  DataConnectivityService() {
    DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      switch (dataConnectionStatus) {
        case DataConnectionStatus.connected:
          connectivityStreamController.add(dataConnectionStatus);
          break;
        case DataConnectionStatus.disconnected:
          connectivityStreamController.add(dataConnectionStatus);
          break;
        default:
          connectivityStreamController.add(DataConnectionStatus.connected);
          break;
      }
    });
  }


  Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup(Strings.google);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      // FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
        print(e);
      return false;
    }
  }
}

final checkDataConnectivity = DataConnectivityService();
