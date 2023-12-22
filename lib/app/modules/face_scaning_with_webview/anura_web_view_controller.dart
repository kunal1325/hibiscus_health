import 'package:webview_flutter/webview_flutter.dart';

import '../../../../import.dart';

class AnuraWebViewController extends GetxController {

  var controller = WebViewController().obs;
  var isLoading = false.obs;

  var url = "https://awe.na-east.nuralogix.ai/c/xsdR1RulaEb/ewogICAgImFnZSI6IDI2LAogICAgImhlaWdodCI6IDE4MSwKICAgICJ3ZWlnaHQiOiAxMTAsCiAgICAiZ2VuZGVyIjogIm1hbGUiLAogICAgInNtb2tpbmciOiAiMSIsCiAgICAiYmxvb2RwcmVzc3VyZW1lZGljYXRpb24iOiAiMSIsCiAgICAiZGlhYmV0ZXMiOiBmYWxzZQp9/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJPcmdhbml6YXRpb25JRCI6ImRhOTA5MzEwLWRlZjktNGI2MS04NzA0LTczMzZhMjJkZTM4YyIsIklEIjoiM2M1Nzg0M2MtNGI5My00ZTkzLWI0NTctMWZlNjVjZmFkMTdjIiwiVHlwZSI6IkRldmljZSIsIkRldmljZUlEIjoiM2M1Nzg0M2MtNGI5My00ZTkzLWI0NTctMWZlNjVjZmFkMTdjIiwiU2Vzc2lvbkdlbiI6MCwiUmVnaW9uIjoibmEtZWFzdCIsImV4cCI6MTcwMzI1NDc5NCwiaWF0IjoxNzAzMjU0MTk0LCJpc3MiOiJ1cm46ZGVlcGFmZmV4In0.fTMvVRok1ZcwnxUhYwf24rhILKdp2NoYysosr_KIYUs/U2FsdGVkX19xF7Q9JOGHqbSMot7o/w2tzWeTIjHCH5Hx+v+M4ugmWnfazaQsdn/FJZhIfDwguewImIf0yGuZSnnkUesCbFU1W1ce+Jas2J19qByJfWod3ufB61eqsJXV2ye+6ZEhmGUf5xQKNbuWQy+mQRXgARoq/bykEn7UDdpElCUy/HwdU9s5Cf0DKrznPiwP0AtLKU5Gj0FJwja0fRNB7mKblrYIdFF0YW96kC3rxNphIOSHRK79JwJTr0mQy1CcADCaPDrKOO1GGcWAgitKj1UrgAiTicRz/919fF5VtaLgSWq1rz/dQdhC9gDOE8+1KJ8j2E0kqaBGLIgm2oRNDWPpV8I7vCPwhOwKa8rmtfZMGBNRcDGEpXYWgdBZaEq6sYLSrSbLkNWaNqCS6z/WiXBWWrtM2co39kST0jpmoGds5YogLY+f+AUVwZSbZ548KL0V3IdwFCnrXcnjm1ylvMkRdT4RKLGZIJmRpFJT3qItI2/8dBKadDoE4rnsjWFMQ9pj6wVcgdlMEIpjMi2SMKFpl2EccKwPxinMCNWuSxkLaBc8RuMKWoISgh8P8KGQ4ILe7ixbGvwox2AkyReoGte3+wvvB7QPRl0N1yQ1rn2EsfpnJ9Sd1V/lf7aJO4YUrRWVw9Qxv/MdqjAe98QJiGZBVe8mKkRtwkoEnEXRfu3KyMLlkE0v9w6/KP6o+oCwxXORHpZPqxWoaUCqeQ+j5hiKeREeGsm++z35YnXIO6BRVcV4GMxTTuTnLSyZDaZaOsOKmVquR3gRYKfps5Gga1q92XKYVwuK1ElL0QHk7/J8onocAsFPvbNBEKpVeqqf9T7W1XKZDDunW0h00ELvA/fBMaiBzZcB4T0ljCYI612oibyF/oMjJXz+dyo4ZcYp6AwM+TMK7BbnC6sLXHKrz0NwTfi2r8Z1KTRUxLn5Ju3qug7vVIxMZVSyJGLwfZQyfkPpKOoq8xDJqZrpluEGgMSvhpUqt2S5zNmHcRXkEcXEgj/WNTEEps+J8zKRrylNsAsS7zjIsp5zNh+9ZlwLuxDsgtgio7iyPVKy09ACqYGx7XOw6vlXLo+vU6GB4OY23O9Z4Wl1axKDYdBsAV+c+qwS/5QSm4vlJ5ywnOWJzeh1YAHr7oAWhqLv30hH/HH42ee59".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isLoading.value = true;
    controller.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            isLoading.value = false;
            if (url.toLowerCase().contains("https://vuejs.org/") && url.toLowerCase().contains("tutorial/")) {
              if (url.toLowerCase().contains("#step-2")) {
                Utils.showSnackBarFun(Get.context, "!!!!!!!!!!!!!! #step-2 !!!!!!!!!!!!!!!!!!!!!!");
              } else if (url.toLowerCase().contains("#step-3")) {
                Utils.showSnackBarFun(Get.context, "!!!!!!!!!!!!!! #step-3 !!!!!!!!!!!!!!!!!!!!!!");
              }
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url.value));
    super.onInit();
  }


}
