import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/firebase_options.dart';
import 'package:tryout/routes/approutes.dart';
import 'package:tryout/routes/routesname.dart';


Future<void> main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => 
       GetMaterialApp(
        title: 'Exam Preparation',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: kIsWeb?Routesnames.adminpanel:Routesnames.splashscreen,
        getPages: Approutes.approutes(),
      ),
    );
  }
}

