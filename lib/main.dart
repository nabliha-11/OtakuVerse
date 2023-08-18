import 'package:flutter/material.dart';
import 'package:otakuverse/presentation/screens/bottom_navigation_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otakuverse/presentation/screens/splash_screen.dart';
import 'package:otakuverse/provider/anime_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AnimeProvider()),
  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 800),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          //title: 'Anime Suggestion App',
          theme: ThemeData(
            // Define your app's theme here
            primarySwatch: Colors.deepPurple,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
            // Add any other theme customization you may want
          ),
          home:SplashScreen(),
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Color(0xFFCCCCCC)],
                  stops: [0.0, 0.8],
                ),
              ),
              child: child,
            );
          },
        );
      },
    );
  }
}
