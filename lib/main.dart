import 'package:dash_app/Provider/categories.dart';
import 'package:dash_app/Provider/google_signin_provider.dart';
import 'package:dash_app/Screens/SplashScreen/splash_screen.dart';
import 'package:dash_app/firebase_options.dart';
import 'package:dash_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoriesProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: MyAppRoutes().goRouter.routeInformationParser,
      routerDelegate: MyAppRoutes().goRouter.routerDelegate,
    );
  }
}
