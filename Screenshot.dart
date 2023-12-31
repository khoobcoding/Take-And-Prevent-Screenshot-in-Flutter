dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  screenshot: ^2.1.0  // Add this Package in your Pubspec.yaml  for screenshot
  path_provider: ^2.1.1  // Add this Package in your Pubspec.yaml for saving screenshot

// Add this Permission in your Android manifest.xml file
    // Permission 1
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.searchingapp">

  // Add these permission
 <!-- Android 12 or below  -->
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

    <!-- Android 13 or greater  -->
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>

          // Permission 2
 <application
        android:label="Searching App" 
        android:name="${applicationName}"
        android:requestLegacyExternalStorage="true"  // Add this 

import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotApp extends StatefulWidget {
  const ScreenshotApp({super.key});

  @override
  State<ScreenshotApp> createState() => _ScreenshotAppState();
}

class _ScreenshotAppState extends State<ScreenshotApp> {
  ScreenshotController screenshotcontroller=ScreenshotController();
  Uint8List? myscreenshot;
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotcontroller,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 36, 98, 254),
          title: const Text('Screenshot App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                myscreenshot==null
                ? SizedBox(width: 200,height: 300,
                child: Center(child: Text('No Screenshot'),),)
                : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 36, 98, 254))
                  ),child: Image.memory(myscreenshot!,
                  width: 200,height: 300,),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                    color: const Color.fromARGB(255, 36, 98, 254),
                    onPressed: () async{
                    //  myscreenshot= await screenshotcontroller.capture();
                    //  setState(() {
                       
                    //  });
                    // screenshotcontroller.captureFromWidget(
                    //   Container(
                    //     width: 200,height: 300,
                    //     color: Colors.blue,padding: EdgeInsets.all(30),
                    //   child: Text('Pin - 72357923'),)
                    // ).then((value) {
                    //   myscreenshot=value;
                    //   setState(() {
                        
                    //   });
                    // }); 
                    final randomint=Random().nextInt(1000);
                    var mylongwidget=Builder(builder:(context) {
                      return Container(padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(border: Border.all(color: Colors.indigo,width: 5),color: Colors.redAccent),
                      child: Column(mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i=0; i<10;i++)
                        Text('Tile Index - ${randomint+i}')
                      ],),);
                    },);

                    screenshotcontroller.captureFromLongWidget(
                      InheritedTheme.captureAll(context, Material(
                        child: mylongwidget,
                      )),context: context
                    ).then((value) {
                      myscreenshot=value;
                      setState(() {
                        
                      });
                    });
                    },
                    child: const Text('Take Screenshot',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20))),
                MaterialButton(
                    color: const Color.fromARGB(255, 36, 98, 254),
                    onPressed: () async{
                      final direc=await getApplicationDocumentsDirectory();
                      await screenshotcontroller.captureAndSave(direc.path,
                      fileName: 'Screenshot - ${DateTime.now()}.png').then((value) {
                        print('Screenshot saved at $value');
                      });
                    },
                    child: const Text('Take Screenshot & Save ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20))),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 300,
                  width: 250,
                  color: Colors.indigo,
                  child: const Center(
                    child: Icon(
                      Icons.g_translate_sharp,
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 300,
                  width: 250,
                  color: Colors.red,
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_command_key_sharp,
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
