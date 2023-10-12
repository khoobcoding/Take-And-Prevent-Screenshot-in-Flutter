dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  no_screenshot: ^0.0.1+6  //  Add this Package in your Pubspec.yaml

import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';

class NoScreenshotApp extends StatefulWidget {
  const NoScreenshotApp({super.key});

  @override
  State<NoScreenshotApp> createState() => _NoScreenshotAppState();
}

class _NoScreenshotAppState extends State<NoScreenshotApp> 
with WidgetsBindingObserver{
  NoScreenshot noscreenshotcontroller=NoScreenshot.instance;
  
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state==AppLifecycleState.resumed){
      noscreenshotcontroller.screenshotOff();
    } if(state==AppLifecycleState.inactive){
      noscreenshotcontroller.screenshotOff();
    } if(state==AppLifecycleState.paused){
      noscreenshotcontroller.screenshotOff();
    } if(state==AppLifecycleState.detached){
      noscreenshotcontroller.screenshotOff();
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 183, 35, 209),
        title: const Text('No Screenshot App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 183, 35, 209))),
              child: const Text('Press to toggle screenshot'),
              onPressed: () async{
                await noscreenshotcontroller.toggleScreenshot();
              },
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 183, 35, 209))),
              child: const Text('Press to turn off screenshot'),
              onPressed: () async{
                await noscreenshotcontroller.screenshotOff();
              },
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 183, 35, 209))),
              child: const Text('Press to turn on screenshot'),
              onPressed: () async{
                await noscreenshotcontroller.screenshotOn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
