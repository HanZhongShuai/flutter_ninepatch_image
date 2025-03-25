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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final assetName = 'assets/test_ninepatch.9.png';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(),
            NinePatchImage(
              imageProvider: AssetImage(assetName),
              sliceCachedKey: assetName,
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
              name: assetName,
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
              name: assetName,
              scale: 3.0,
              alignment: Alignment.center,
              child: Text(
                'test\ntest\ntest\ntest',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            NinePatchImage.asset(
              name: assetName,
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
              name: assetName,
              alignment: Alignment.center,
              child: Text(
                'test test test test test test test test test test test test test test test test test test test test',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
