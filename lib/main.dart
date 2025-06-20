
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:TubeSurf/platform/android/home.dart';
import 'package:TubeSurf/platform/macos/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:switch(
    defaultTargetPlatform
  ){
    TargetPlatform.android => AndroidHome(),
    TargetPlatform.macOS => MacHome(),
    TargetPlatform.windows => MacHome(),
    _ => Placeholder()
  }
  ));

  
}

