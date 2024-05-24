import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/home_page_view_model.dart';
import 'widgets/animated/app_animated_icon/app_animated_icon_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppAnimatedIconViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
