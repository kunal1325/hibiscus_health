import '../../../import.dart';

extension FutureExt<T> on Future<Response<T>?> {

  void futureValue(
      Function(T value) response, {
        Function(String? error)? onError,
        VoidCallback? retryFunction,
        bool showLoading = true,
      }) {
    final _interface = Get.find<ApiInterfaceController>();
    _interface.error = null;

    this.timeout(
      Constants.timeout,
      onTimeout: () {
        Utils.showSnackBar(Strings.connectionTimeout);
        _retry(_interface, retryFunction!);
        throw const ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        );
      },
    ).then((value) {

      if (value?.body != null) {
        final result = ApiResponse.getResponse<T>(value!);
        if (result != null) {
          print("Extension ===============> ");
          print("$result");
          response(result);
        }
      }else{
        print(" ===============> body null $value");
        Utils.showDialog(
          "Something Went Wrong !!!",
          onTap: () => Get.back()
        );
      }

      _interface.update();
    })
        .catchError((e) {

      if (e == null) return;

      final String errorMessage = e is ApiError ? e.message : e.toString();

      if (e is ApiError) {
        if ((e.type == ErrorType.connectTimeout ||
            e.type == ErrorType.noConnection)) {
          _interface.error = e;

          _retry(_interface, retryFunction!);
        } else {
          Utils.showDialog(
            errorMessage,
            onTap: errorMessage != Strings.unauthorized
                ? null
                : () {
              Storage.clearStorage();
              Get.offAllNamed(
                Routes.signIn,
              );
            },
          );
        }
      }

      if (onError != null) {
        onError(errorMessage);
      }

      printError(info: 'catchError: error: $e\nerrorMessage: $errorMessage');
    });
  }

  void _retry(
      ApiInterfaceController _interface,
      VoidCallback retryFunction,
      ) {
    _interface.retry = retryFunction;
    _interface.update();
  }

}