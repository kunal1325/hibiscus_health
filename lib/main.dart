import 'import.dart';

void main() {
  Initializer.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<DataConnectionStatus>(
      create: (_) {
        return DataConnectionChecker().onStatusChange;
      },
      initialData: DataConnectionStatus.connected,
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (BuildContext context, child) => GetMaterialApp(
          defaultTransition: Transition.fade,
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          initialBinding: InitialBindings(),
        ),
      )
    );
  }
}