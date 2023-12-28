import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../../import.dart';

class AnuraWebViewController extends GetxController {
  var controller = WebViewController().obs;
  var isLoading = false.obs;

  var url =
      "https://awe.na-east.nuralogix.ai/c/xsdR1RulaEb/gqw2YdH1dveVGaUq26bfv2yuGdAbPcuMlvpQCvhJkUl%2Ft4C6bcXIVqXGaBk01Lx7UjZ%2Bths4UsZYs%2FekC8ZiJ87yz90aDyEA4pKbzBGR8y4KhfJ04tyqMWKSXPtlNwvzmjlm8Ilgfjytgsk8coUSjTgTFa7N6I3tZGWKH2xG0%2FHI3eNPzcpcTxCSIwajs9WHli4R3IdmdNjjJz%2FkU5wZl748pjQLFpxav2R3Ih7tYjA970YE3kKaNA0tyXb%2BarTMU03B7bH8Q%2B0s55r8PuhZTkkm8eYpjNEGSy6%2F2s2XEtqrr3addq%2BsvHrTXgH%2FD3qgPCG7HwtAt%2FrLon4EQvdvCw%3D%3D/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJPcmdhbml6YXRpb25JRCI6ImRhOTA5MzEwLWRlZjktNGI2MS04NzA0LTczMzZhMjJkZTM4YyIsIklEIjoiNWNhNTdhYmYtMGRmMy00MjAzLWI1ZTgtZTczZDI2Yjc2MzRjIiwiVHlwZSI6IkRldmljZSIsIkRldmljZUlEIjoiNWNhNTdhYmYtMGRmMy00MjAzLWI1ZTgtZTczZDI2Yjc2MzRjIiwiU2Vzc2lvbkdlbiI6MCwiUmVnaW9uIjoibmEtZWFzdCIsImV4cCI6MTcwMzcwMTY0OSwiaWF0IjoxNzAzNzAxMDQ5LCJpc3MiOiJ1cm46ZGVlcGFmZmV4In0.SrH7JvXI5tHlEGmQS2As4A80LqGznzB4qvJ8sKuAcAY/U2FsdGVkX18a0OEnVBIZCw2ApJ4OkPDRqAQaxqB6kSKHNorT27pE%2B8qCN9gCBQLwGhbY%2F3%2F6XRiGBFzUMXye7Ew62t1nnV4OaQy%2BJTKSpZTYpGQOG8iORKPEmPcE3eCQDY%2BRbQf3t3Qxll4hsco3awsZQEC6CYu5uYVTT6fNyQ1Xv9Upq6X4%2FDuHjYlebcrANVRsxM4F6%2BA0euW1xY%2BghfsOOyMvQiCT7U60N5XqtNgtfO0aqALSmd5BBhepxF53L0%2BPwRcbO3doDDWmjKLkmyAH1xlKVfOoPka%2F2stmUCzwKVIJ4ExWI3KH2szK9qgLtKh7vDtoCWkWO1aLyYsgudXWeMbqv3cSpkOoeDsI4pqRlsdPd5rxtDNwhfFvrmcnmlE1gh5Pqo42xz9x4Id4WIsTuGb4dD%2B3zhKd4zmqvBpi6acupMe%2BVxzS70qUsf7POTMfmMpM01TnpSGSsjDQm6tdBUEXtO2UQE%2BQno3mUF7W1sf9%2FBqp4olWIq5tAVXkfFHOtTmSomBbZTUxYi26dO7yC2bDPnYKYb4zzfriogtw6aIT%2Fld0gMvKy3Xg5fPLdN7MuI%2BU4TlfYIJga0J66w9Q5h%2B0ViEZo7UDuF%2BaY6VHmY9cEBxX9eGPLumpPROa%2Bt2RLeKaGibhNCneaWCKXKT1Qh0q88YctrtA8b2D2m1sJcfeI8W3FkHt0n%2B%2Bl2ZizfRgWDDnfkWhQfOAWMKmFmv%2B6n9LRzn1td0TzfhKO%2BIysveYgAZRFI4PwtWOkTCI%2FPQyFD8Vw6ii9DsZ3yZeIheDlZkRTfoR7aXUD9dnaRWmdYB8vXLM6%2FzFbHSkb3ip%2BQljtwqK7%2FFK6HEohJw%2F19BNXPeR5cRntm92Ia8073mUvDszjTxHTHC7mr7F0i40d2ftk80ZKW7CMah6nIBxZSEd2gLUiHSlwO85IB%2BRX4Y4WwSF33iZmQT1xZz3Xifamp0zKWQ%2FvP3l9DkQKLdzHRnZV3rJGEhmLfZKq4fFE6Zo00pmCzrW7jMeHCqLkzE0JRpWUL77lRApCUfLJi8oRsQ8acoGCdNsgQJ2h6ZmmEwra5ZKj1Y6mjdG%2BURhtlFC01TLj7cPowKykGh5AB9v3yv53bl%2FY%2FvzeRaKYA86zhuFCv41XMYSjGhwa8zYzEfE"
          .obs;
  var url2 =
      "https://awe.na-east.nuralogix.ai/c/xsdR1RulaEb/OqhGnV89GdDc7kCnVv6OePpKQQxHE9VujJpYzXXG7kU23h%2B6Yyu6ydVr50bv7AB95psphf%2BWss7CFX88D7T3j6Phm0WYEWkVKRdEGIy%2F6u4TTg0nf2OC3QA2C5OS5pvVDMyVEsm5wO6PqUdghgsHQ6y9q8YRhl5Qm3%2FWV2JPcPHTEnh2st6ZgwB0X87FzOi5imJlhyPFyGTXgDRCDj7JPu32TdGqWqYXc3r%2FNB1K0UVV1yBy6hMn7YYGHHcXlRN4rGujPLojal1OApXqBhyIhcudbhBZaJiuIIWQX8XH%2Fm4sK3NtlE%2Fv%2BQKYpIxrqRWyTkB%2FWTObVmMjK3HyyX%2BDEQ%3D%3D/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJPcmdhbml6YXRpb25JRCI6ImRhOTA5MzEwLWRlZjktNGI2MS04NzA0LTczMzZhMjJkZTM4YyIsIklEIjoiODIyNDA1NzItZGI0Yy00YzQwLWE4ZjItZjBlZTYxYjhiMWFmIiwiVHlwZSI6IkRldmljZSIsIkRldmljZUlEIjoiODIyNDA1NzItZGI0Yy00YzQwLWE4ZjItZjBlZTYxYjhiMWFmIiwiU2Vzc2lvbkdlbiI6MCwiUmVnaW9uIjoibmEtZWFzdCIsImV4cCI6MTcwMzc3MzYwNCwiaWF0IjoxNzAzNzczMDA0LCJpc3MiOiJ1cm46ZGVlcGFmZmV4In0.C8LMkZfgHIGuyOoaPrAT2SNYz4ujZ2KKzFxGGKXav4c/U2FsdGVkX1%2FBH4LoVulqSq0%2B8b%2BM2t2%2Fq449D%2FNCgpXFI%2FRWwGPRQPKNJ5Eya4At0ROBEbT3coHNOVbZP%2B9Ya43jlYGmhUzKYuhBZDl4igN%2Ba8gj%2F0DqhUCn%2Ffgih4Um2HfrLIklas5LkAHMmUoHUgDs%2BDNegdi1MVICZW9sfcEQFLHznu5kHJ6%2FgVPAATaTKcRmmO8ASFXzZ1RN5%2BR2ORyDeTDYpMQ2J8a0TikArOHbpGOAO4SnzsaE9wCg9xLkIpF4pCGDrZpAhrmBFb2uxjqk%2Bwi%2BVuoM2q6Hebks7bgYUMnXzDHBBWhSiyD0sSvnbF1AbO1%2FneZpIEWKp62Mde9QFvj6L56J%2BsxUpniHgMy9SEslPrJ0JQbSRnn9D0irpQhqusudbjooYoofLiDxXJKQUQqEbcNAIWO7NRaL7amEyDHnG5xx10Fq4CtJwCDSL%2FUO2RQac%2BJy%2FF8DvbMRPyztKIE6xSnvSmbFj5c3RTl3QsRIFWK6gnsjSme8Ncpb8F3%2BeM0aeEqiWVQSZvgRWQhbi%2Bbk7RuMx2ZhUQYybPLpMJ8ozg8BQSjFwgMqUYNPcxcMRZzi%2F3iZAUC%2FSEiB6p5X6DW%2FGXJQzL3L%2B3hCPO2YRYxOLJawOAxn3abXAbn%2Fn11msz4XoEu9vKQBwOB9sk5lpm5sPwsoiIQFCDvLFQQUy76bStbrw8iLVVSxlvnEWzwJq8pAfGM9pvx2ySrYF9DgGsxDrYGXn9IGrhdQmIcdUjgT2OJDmyprm%2BoZOmJdANItinT%2B2%2FWLJaCqsBTjlD1tNyaKHNj44bTMaIuMb%2Fv4a9REHXNInznx%2F9P4UtZOiHSQdJ9wW1F%2Fxxn%2FTGDUCzbTQPjP2eDaYyVTFm1OijokCRTyt%2BF35z6QiZ6TX2aJoqCuQRxFQzY8qkorFiGCePNnDw5OZJIUxa26imkOdszQFvTUVh%2B0jCySPL%2BX3vhgcNUgQAWoztyyVLGG%2FFUyHgo6CL3ju6%2F0WDnKkyqtO8stQCeQa25c3nwzd8fDWcnmxhoAdTX0rpM2dGSI9eEwDHrUQIKP0nWdDxcgrwnJlaqBtt1m3Jl7PG5OhBTYAGOJekQJm6b5DWFyZ%2Fzrh8G3rxLcGomQTclVBviINwUR1LYgVWcL%2B%2BM8Iu4NhJUEsgO6/HH42ee59"
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
              Utils.showSnackBarFun(
                  Get.context, "!!!!!!!!!!!!!! results !!!!!!!!!!!!!!!!!!!!!!");
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
              // print("results ====================>>>>>>>>>>>>>>>\n");
              // print(results);
              // print("results hash ====================>>>>>>>>>>>>>>>\n");
              // print(result);
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
