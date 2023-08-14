// ignore_for_file: must_be_immutable
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'firstscreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class moi extends StatefulWidget {
  const moi({super.key});

  @override
  State<moi> createState() => _moiState();
}

class _moiState extends State<moi> {
  bool darkMode = false;
  dynamic savedThememode;
  String iconadress = "";
  void initState() {
    super.initState();
    getCurrentTheme;
  }

  Future getCurrentTheme() async {
    savedThememode = await AdaptiveTheme.getThemeMode();
    if (savedThememode.toString() == 'AdaptiveThemeMode.dark') {
      darkMode = true;
    } else {
      darkMode = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SwitchListTile(
                  activeColor: Colors.green,
                  value: darkMode,
                  onChanged: (bool value) {
                    if (value == true) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                   setState(() {
                      darkMode = value;
                   });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
         appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
       
        primaryColor: Colors.black,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: FirstScreen(),
      ),
    );
  }
}
