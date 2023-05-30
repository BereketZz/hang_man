import 'package:flutter/material.dart';
import 'package:hang_man/Colors/colors.dart';
import 'package:hang_man/Widget/_figurImage.dart';
import 'package:hang_man/Gamevar/Game.dart';
import 'package:hang_man/Widget/letters.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word = "FLUTTER";
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text('Hangman'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  figurImage(Game.trys >= 0, 'assets/hang.png'),
                  figurImage(Game.trys >= 1, 'assets/head.png'),
                  figurImage(Game.trys >= 2, 'assets/body.png'),
                  figurImage(Game.trys >= 3, 'assets/la.png'),
                  figurImage(Game.trys >= 4, 'assets/ra.png'),
                  figurImage(Game.trys >= 5, 'assets/ll.png'),
                  figurImage(Game.trys >= 6, 'assets/rl.png')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: word
                  .split('')
                  .map((e) => letters(e.toUpperCase(),
                      Game.selectedChar.contains(e.toUpperCase())))
                  .toList(),
            ),
            SizedBox(
                width: double.infinity,
                height: 250,
                child: GridView.count(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding: EdgeInsets.all(8.0),
                  children: alphabets.map((e) {
                    return RawMaterialButton(
                      onPressed: Game.selectedChar.contains(e)
                          ? null
                          : () {
                              setState(() {
                                Game.selectedChar.add(e);
                                print(Game.selectedChar);
                                if (!word.split('').contains(e)) {
                                  Game.trys++;
                                }
                              });
                            },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Text(
                        e,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      fillColor: Game.selectedChar.contains(e)
                          ? Colors.black87
                          : Colors.blue,
                    );
                  }).toList(),
                ))
          ]),
    );
  }
}
