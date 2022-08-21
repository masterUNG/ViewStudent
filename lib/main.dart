import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/states/app_service_student.dart';
import 'package:viewstudent/states/login.dart';
import 'package:viewstudent/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (context) => const Login(),
  '/appService': (context) => const AppServiceStudent(),
};

String? keyState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyAMJ2rnHbcfxite_2ggunbpQXLL50LOf2w", // Your apiKey
    //   appId: "1:207151841933:web:3654fee96c62456d7258c4", // Your appId
    //   messagingSenderId: "207151841933", // Your messagingSenderId
    //   projectId: "viewstudent-81514", // Your projectId
    // ),
  ).then((value) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        // SignOut Status
        keyState = '/login';
        runApp(const MyApp());
      } else {
        // SignIn Status
        keyState = '/appService';
        runApp(const MyApp());
      }
    });
  }).catchError((onError) {
    print('onError ===> $onError');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: keyState,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: MyConstant.primary,
        ),
      ),
    );
  }
}
