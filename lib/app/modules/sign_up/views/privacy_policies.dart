import '../../../../import.dart';

class PrivacyPoliciesPage extends StatelessWidget {
  final WebViewController webController  = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) async {
          if (request.url.contains('mailto:')) {
            if (await canLaunchUrl(Uri.parse(request.url))) {
              await launchUrl(Uri.parse(request.url));
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(Constants.PRIVACY_POLICIES_URL));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: webController),
      ),
    );
  }
}
