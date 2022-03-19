// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    super.initState();
    
    _checkVersion();
  }


  // void _checkVersion() async{

  //   final newVersion = NewVersion(
  //     androidId: 'com.snapchat.android',
  //   );

  //   // You can let the plugin handle fetching the status and showing a dialog,
  //   // or you can fetch the status and display your own dialog, or no dialog.
  //   const simpleBehavior = true;

  //   if (simpleBehavior) {
  //     basicStatusCheck(newVersion);
  //   } else {
  //     advancedStatusCheck(newVersion);
  //   }
  // }

  // basicStatusCheck(NewVersion newVersion) {
  //   newVersion.showAlertIfNecessary(context: context);
  // }

  // advancedStatusCheck(NewVersion newVersion) async {
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null) {
  //     debugPrint(status.releaseNotes);
  //     debugPrint(status.appStoreLink);
  //     debugPrint(status.localVersion);
  //     debugPrint(status.storeVersion);
  //     debugPrint(status.canUpdate.toString());
  //     newVersion.showUpdateDialog(
  //       context: context,
  //       versionStatus: status,
  //       dialogTitle: 'Custom Title',
  //       dialogText: 'Custom Text',
  //     );
  //   }
  // }
void _checkVersion() async{
  final newVersion = NewVersion(
    androidId: "com.facebook.katana",
  );
  final status = await newVersion.getVersionStatus();
  newVersion.showUpdateDialog(context: context, 
  dialogTitle: "UPDATE",
  dismissButtonText: "Skip",
  dialogText: "Please update the app from " + "${status!.localVersion}" + "to" + "${status.storeVersion}",
  dismissAction: (){
    SystemNavigator.pop();
  },
  updateButtonText: "Lets Update", versionStatus: status,
  );

  print("Device :" + status.localVersion);
  print("Store :" + status.storeVersion);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example App"),
      ),
    );
  }
}