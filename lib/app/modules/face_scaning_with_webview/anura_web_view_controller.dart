import 'package:webview_flutter/webview_flutter.dart';

import '../../../../import.dart';

class AnuraWebViewController extends GetxController {

  var controller = WebViewController().obs;
  var isLoading = false.obs;

  var url = "https://awe.na-east.nuralogix.ai/c/xsdR1RulaEb/gqw2YdH1dveVGaUq26bfv2yuGdAbPcuMlvpQCvhJkUl%2Ft4C6bcXIVqXGaBk01Lx7UjZ%2Bths4UsZYs%2FekC8ZiJ87yz90aDyEA4pKbzBGR8y4KhfJ04tyqMWKSXPtlNwvzmjlm8Ilgfjytgsk8coUSjTgTFa7N6I3tZGWKH2xG0%2FHI3eNPzcpcTxCSIwajs9WHli4R3IdmdNjjJz%2FkU5wZl748pjQLFpxav2R3Ih7tYjA970YE3kKaNA0tyXb%2BarTMU03B7bH8Q%2B0s55r8PuhZTkkm8eYpjNEGSy6%2F2s2XEtqrr3addq%2BsvHrTXgH%2FD3qgPCG7HwtAt%2FrLon4EQvdvCw%3D%3D/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJPcmdhbml6YXRpb25JRCI6ImRhOTA5MzEwLWRlZjktNGI2MS04NzA0LTczMzZhMjJkZTM4YyIsIklEIjoiNWNhNTdhYmYtMGRmMy00MjAzLWI1ZTgtZTczZDI2Yjc2MzRjIiwiVHlwZSI6IkRldmljZSIsIkRldmljZUlEIjoiNWNhNTdhYmYtMGRmMy00MjAzLWI1ZTgtZTczZDI2Yjc2MzRjIiwiU2Vzc2lvbkdlbiI6MCwiUmVnaW9uIjoibmEtZWFzdCIsImV4cCI6MTcwMzcwMTY0OSwiaWF0IjoxNzAzNzAxMDQ5LCJpc3MiOiJ1cm46ZGVlcGFmZmV4In0.SrH7JvXI5tHlEGmQS2As4A80LqGznzB4qvJ8sKuAcAY/U2FsdGVkX18a0OEnVBIZCw2ApJ4OkPDRqAQaxqB6kSKHNorT27pE%2B8qCN9gCBQLwGhbY%2F3%2F6XRiGBFzUMXye7Ew62t1nnV4OaQy%2BJTKSpZTYpGQOG8iORKPEmPcE3eCQDY%2BRbQf3t3Qxll4hsco3awsZQEC6CYu5uYVTT6fNyQ1Xv9Upq6X4%2FDuHjYlebcrANVRsxM4F6%2BA0euW1xY%2BghfsOOyMvQiCT7U60N5XqtNgtfO0aqALSmd5BBhepxF53L0%2BPwRcbO3doDDWmjKLkmyAH1xlKVfOoPka%2F2stmUCzwKVIJ4ExWI3KH2szK9qgLtKh7vDtoCWkWO1aLyYsgudXWeMbqv3cSpkOoeDsI4pqRlsdPd5rxtDNwhfFvrmcnmlE1gh5Pqo42xz9x4Id4WIsTuGb4dD%2B3zhKd4zmqvBpi6acupMe%2BVxzS70qUsf7POTMfmMpM01TnpSGSsjDQm6tdBUEXtO2UQE%2BQno3mUF7W1sf9%2FBqp4olWIq5tAVXkfFHOtTmSomBbZTUxYi26dO7yC2bDPnYKYb4zzfriogtw6aIT%2Fld0gMvKy3Xg5fPLdN7MuI%2BU4TlfYIJga0J66w9Q5h%2B0ViEZo7UDuF%2BaY6VHmY9cEBxX9eGPLumpPROa%2Bt2RLeKaGibhNCneaWCKXKT1Qh0q88YctrtA8b2D2m1sJcfeI8W3FkHt0n%2B%2Bl2ZizfRgWDDnfkWhQfOAWMKmFmv%2B6n9LRzn1td0TzfhKO%2BIysveYgAZRFI4PwtWOkTCI%2FPQyFD8Vw6ii9DsZ3yZeIheDlZkRTfoR7aXUD9dnaRWmdYB8vXLM6%2FzFbHSkb3ip%2BQljtwqK7%2FFK6HEohJw%2F19BNXPeR5cRntm92Ia8073mUvDszjTxHTHC7mr7F0i40d2ftk80ZKW7CMah6nIBxZSEd2gLUiHSlwO85IB%2BRX4Y4WwSF33iZmQT1xZz3Xifamp0zKWQ%2FvP3l9DkQKLdzHRnZV3rJGEhmLfZKq4fFE6Zo00pmCzrW7jMeHCqLkzE0JRpWUL77lRApCUfLJi8oRsQ8acoGCdNsgQJ2h6ZmmEwra5ZKj1Y6mjdG%2BURhtlFC01TLj7cPowKykGh5AB9v3yv53bl%2FY%2FvzeRaKYA86zhuFCv41XMYSjGhwa8zYzEfE".obs;

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
