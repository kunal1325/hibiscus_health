import '../../../import.dart';

class ConnectivityCheckWidget extends StatelessWidget {
  final Widget body;

  ConnectivityCheckWidget({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Provider.of<DataConnectionStatus>(context) ==
                  DataConnectionStatus.disconnected
              ? OfflineScreen()
              : Expanded(child: body)
        ],
      ),
    );
  }
}
