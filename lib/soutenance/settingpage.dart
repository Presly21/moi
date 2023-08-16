import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:monprojet/soutenance/widgets/small_text.dart';

import 'EditAccount.dart';
import 'dark_theme.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});
  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  bool darkmode = false;
  dynamic savedThemeMode;
  void iniState() {
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await darkTheme.appBarTheme;
  }

  Widget thememodde() {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
         primarySwatch: Colors.blueGrey,
        colorScheme: const ColorScheme.light(),
     pageTransitionsTheme: const PageTransitionsTheme()
      ),
      dark: ThemeData(
            scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.dark,
          colorScheme: const ColorScheme.light(),
          pageTransitionsTheme: const PageTransitionsTheme(),
         primaryColor: Colors.white,
         primarySwatch: Colors.blueGrey,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Parametre'),
        backgroundColor: Colors.blueGrey[900]!,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 26),
            height: 30,
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: SwitchListTile(
                      
                      value: darkmode,
                      onChanged: (bool value) {
                        if (value == true) {
                          AdaptiveTheme.of(context).setDark();
                        } else {
                          AdaptiveTheme.of(context).setLight();
                        }
                        setState(() {
                          darkmode = value;
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
        // Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 31),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[900]!,
            ),
            height: 500,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text("Mon Compte",
                      style: TextStyle(
                          color: Colors.grey[100]!,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                      
                                  // image: const DecorationImage(
                                  //   fit: BoxFit.cover,
                                  //   image: AssetImage("images/hoe.png"),
                                  // ),
                                ),
                                child: const Icon(
                                          Icons.person,
                                          size: 50,
                                        ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 18)),
                              Column(
                                children: [
                                  Smalltext(
                                    text: "Presly Ebonke",
                                    color: Colors.grey[100]!,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Smalltext(
                                    text: "+237-677-476-491",
                                    color: Colors.grey[100]!,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 28)),
                              Column(
                                children: [
                                  GestureDetector(
                                       onTap: (
                    
                                   
                                  ) {
                    Navigator.push( 
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditAccount(),
                    ));
                                  },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50),
                                        color: Colors.grey,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 20),
                  child: const Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Envoyer un commentaire",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.normal)),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 33)),
                              Column(
                                children: [
                                  SizedBox(
                                    child: Icon(
                                          Icons.message,
                                          size: 30,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Langue",
                                      style: TextStyle(
                                          color: Colors.grey[100]!,
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.normal)),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 150)),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Français",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_rounded,
                                        size: 30,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25, left: 20),
                    child: const Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                              Column(
                                  children: [
                                    Text("Securité",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.normal)),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 156)),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.security,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text("Nous Noté",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.normal)),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 102)),
                              Column(
                                children: [
                                  Row(
                                      children: List.generate(
                                          5,
                                          (index) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15)))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 20),
                  child: const Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Deconnecter",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.normal)),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 125)),
                              Column(
                                children: [
                                  SizedBox(
                                    child: Icon(
                                      Icons.logout,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
