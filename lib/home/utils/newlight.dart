import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class themeM extends StatefulWidget {
  const themeM({super.key});

  @override
  State<themeM> createState() => _themeMState();
}

class _themeMState extends State<themeM> {
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
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                child: Text("changer de theme")),
          ),
        ],
      ),
    );
  }
}
