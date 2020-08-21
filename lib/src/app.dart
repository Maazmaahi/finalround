import 'package:final_round/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'ui/router.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScrollDemo',
      home: HomeScreen(),
//      onGenerateRoute: Router.generateRoute,
//      initialRoute: initialRoute,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
        fontFamily: "Roboto",
      ),
    );
  }
}
