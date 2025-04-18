import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/firebase_options.dart';
import 'package:firebase_sample/view/home.dart';
import 'package:firebase_sample/viewmodel/provider.dart';
import 'package:firebase_sample/viewmodel/secondprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Secondprovider(),),
        ChangeNotifierProvider(create: (context) => StudentProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}