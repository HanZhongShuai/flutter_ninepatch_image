import 'package:flutter/material.dart';
import 'package:flutter_ninepatch_image/flutter_ninepatch_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ninepatch image',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ninepatch image demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NinePatchImage(
                imageProvider: AssetImage('assets/test_ninepatch.9.png'),
                cachedKey: 'assets/test_ninepatch.9.png',
                scale: 3.0,
                alignment: Alignment.center,
                child: Text(
                  'test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              NinePatchImage.asset(
                name: 'assets/test_ninepatch.9.png',
                scale: 3.0,
                alignment: Alignment.center,
                child: Text(
                  'test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              NinePatchImage.asset(
                name: 'assets/test_ninepatch.9.png',
                scale: 3.0,
                alignment: Alignment.center,
                child: Text(
                  'test test test test test test test test test test test test test test test test test test test test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              NinePatchImage.asset(
                name: 'assets/test_ninepatch.9.png',
                alignment: Alignment.center,
                child: Text(
                  'test test test test test test test test test test test test test test test test test test test test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
