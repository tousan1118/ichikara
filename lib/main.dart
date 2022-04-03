import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_banner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const IchikaraApp());
}

class IchikaraApp extends StatelessWidget {
  const IchikaraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICHIKARA',
      theme: ThemeData(
          textTheme: GoogleFonts.sawarabiMinchoTextTheme(
            Theme.of(context).textTheme,
          ),
          brightness: Brightness.light),
      darkTheme: ThemeData(
          textTheme: GoogleFonts.sawarabiMinchoTextTheme(
            Theme.of(context).textTheme,
          ),
          brightness: Brightness.dark),
      home: const MyHomePage(title: 'ICHIKARA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _displayNumber = 0;

  void _randomSetNumber() {
    setState(() {
      _displayNumber = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.amber[100],
      ),
      body: Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
          AdBanner(size: AdSize.banner),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 200),
            child: const Text('Random Integer Is Here',
                style: TextStyle(fontSize: 15)),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: 200,
            height: 100,
            child: Text('$_displayNumber',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            alignment: const Alignment(0, 0),
            decoration: BoxDecoration(
              color: Colors.amber[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(10, 10),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  blurRadius: 50,
                ),
                BoxShadow(
                  offset: const Offset(-10, -10),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  blurRadius: 50,
                ),
              ],
            ),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton.icon(
            onPressed: _randomSetNumber,
            icon: const Icon(Icons.bubble_chart_outlined),
            label: const Text('Dice Number'),
          ),
        ]),
      ]),
    );
  }
}
