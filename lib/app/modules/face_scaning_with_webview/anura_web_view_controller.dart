import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../../import.dart';

class AnuraWebViewController extends GetxController {
  var controller = WebViewController().obs;
  var isLoading = false.obs;

  var url2 =
      "https://awe.na-east.nuralogix.ai/c/xsdR1RulaEb/mK3DA4D9xv7dBa5iDn%2Blu8JQKrDBapVpgnkJ8wgZvnQw2mjn2UJ0SvJcbngUiRsjlQ%2B%2Bkfp2ORuVPkZ0Megqyr%2B6g2mNt6d9snsoxQpp2akb8fmjd45je%2FkR1ucE1svID7cQENtUO1vvGOd3CSp35QqegJRtkvhzYJBENaMEM2tOFSVxNWBMB6aF%2FHda2nbb8%2BjpLRBx0rndjm0%2BqkpW2JcyRnHqrVBLygLiSZBct0XfCimTFnzASkZ%2FEycjeBaSwLJtJfP4J8OmceagtniQNmkXKPQ4E9XG6xolmNP0eqmOsKa%2FKyAiToAE4tsRsfb4y0MuAYN4ZWTqbnzD2TDzAg%3D%3D/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJPcmdhbml6YXRpb25JRCI6ImRhOTA5MzEwLWRlZjktNGI2MS04NzA0LTczMzZhMjJkZTM4YyIsIklEIjoiMDcwYjQ2NzItMjFhMy00MWU3LWI2Y2UtMTNkMjNkNGRjM2VlIiwiVHlwZSI6IkRldmljZSIsIkRldmljZUlEIjoiMDcwYjQ2NzItMjFhMy00MWU3LWI2Y2UtMTNkMjNkNGRjM2VlIiwiU2Vzc2lvbkdlbiI6MCwiUmVnaW9uIjoibmEtZWFzdCIsImV4cCI6MTcwMzg1OTUxMSwiaWF0IjoxNzAzODU4OTExLCJpc3MiOiJ1cm46ZGVlcGFmZmV4In0.FOZa-oFyCPOYWABRYuOZS_abkAY-A_WkyIUSKoJ9RvM/U2FsdGVkX1%2FkQenSlhKZdl8qIS%2FUzgxPlNqbyBohI7xTDiHVBtvdCWXI7PlsFg29T9QL0YfZGiLuyRhHzmhqVlKOStJE14zc34ozvxxZTU1tpdiQ7QarGnftreAf%2FbI8mHnr7alcxeexbOpPar9W4yS5YKetVNYpNnsd1pOYt3rsNvMO9E0iC413aSFXC%2BPsPzZRnvcE9jtAythHXHORGMjqGJwYkjLURXrCd0gMUFBp9dhJv7G3szf4kGfqnQ9UtU%2FOL2DQCLH7ULruXwVDQxzX74mZplOlbkz0pjKJGlmHYk6fYQ3rJ9ofu79i7v23mJxDDKwb0mDZmuQNeTTcF%2BTCClVcw3xi4aYzls7y6QDtNubUQWo9bVM0V2H1EdRWBcnCe3ZqcKpntjNmXrFGbCNQVAjAlZmf38uQcrohyflzs023MCsQP0T1DpYEu389mDOBQZSBdyNbmq4bLWyiSa0cCXD%2FM1nvsKXRxCoF3nEgu9iDWBCEFHGbOxTYKD3hDET3XtFCVRtIuDWU8zOVWgrKvJxzpXjt26xsi3CJDf%2FJFdG3HLUtyGfFbgTPaSckWjMyO0CBTq4cZVnTBFXWn1kWhguPjil%2Bs95ZB7FwV%2BwDY%2BHeH8Sa%2BQ5nbEk03dFCpMgVdUOvlK7Lsca%2FYE%2Bq%2Fe2Ts6QKQ54QuxPlLGdlcKtW%2BLiQ1bdP26FaxMvMh0tG7l%2FoWOelYUp6T2My8IrX8Bxr4TiWnYP1IpW2vXJRS8SXSOdZMlVNabtKNpACAUrptda%2FScBQFAXd8KH%2FiFP6iK5OWB6KqeS8Y3BUOAka1mwAKb1%2BHMZHgRbjNuy%2B77qKDCJ9hthP65BrFqQvcmAG%2FX%2BFMT%2Be%2BYahtfGFGLtQenW8SpR2R%2F0WyJcHJzDxrrldz4%2F7ztZb7olEaMEg8PBhrj3EGm%2Bb1vyPJIA%2BDFATJDj8w7V%2BqYEcspwxb8BpKfk7rgJ3Dfc7cNm9fh4C2r2YkAt7oB%2BCjLBeWtHz3LgkQ50zp0qpYmvCkqY4AXNGhZTgNSAiRQQ2lx8PkIEn2h2MkNcEoaD2Lgzvd8sAEVp64p9L%2FOoAL18JDqwriDl6uXIk5tdMqQhXA1dTpgLtRLxXzApBNlY%2B5Lz3mLaNJqNmM8hyNp6I7UThKjpHIJX%2FMKsO"
          .obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isLoading.value = true;

    PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams
          .fromPlatformWebViewControllerCreationParams(params);
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController newController =
        WebViewController.fromPlatformCreationParams(
      params,
      onPermissionRequest: (request) {
        request.grant();
      },
    );

    newController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            isLoading.value = false;
            if (url.toLowerCase().contains(
                "https://assessment.hibiscushealth.com/dashboard?results=")) {
              var results = url;
              var baseUrlResult =
                  "https://assessment.hibiscushealth.com/dashboard?results=";
              final String result = results.replaceFirst(baseUrlResult, '');
              print("url2 ====================>>>>>>>>>>>>>>>\n");
              print("${Uri.parse(url2.value)}");
              print("debugPrint url2 ====================>>>>>>>>>>>>>>>\n");
              debugPrint("${Uri.parse(url2.value)}");
              print("printWrapped url2 ====================>>>>>>>>>>>>>>>\n");
              printWrapped("${Uri.parse(url2.value)}");
              Get.offAll(() => LandingScreen());
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
      ..loadRequest(Uri.parse(url2.value));
    controller.value = newController;
    super.onInit();
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
