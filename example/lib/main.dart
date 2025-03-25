import 'package:cached_network_image/cached_network_image.dart';
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
    final networkUrl =
        'https://github.com/HanZhongShuai/flutter_ninepatch_image/blob/main/images/test_ninepatch.9.png?raw=true';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacer(),

                ///
                Text('imageProvider: AssetImage'),
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
                SizedBox(height: 16),

                ///
                Text('imageProvider: CachedNetworkImageProvider'),
                NinePatchImage(
                  imageProvider: CachedNetworkImageProvider(networkUrl),
                  sliceCachedKey: networkUrl,
                  scale: 3.0,
                  alignment: Alignment.center,
                  child: Text(
                    'test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  defaultBuilder: (context, child) {
                    return Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: child,
                    );
                  },
                ),
                SizedBox(height: 16),

                ///
                Text('NinePatchImage.asset 1, scale: 3.0'),
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
                SizedBox(height: 16),

                ///
                Text('NinePatchImage.asset 2, scale: 3.0'),
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
                SizedBox(height: 16),

                ///
                Text('NinePatchImage.asset 3, scale: 3.0'),
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
                SizedBox(height: 16),

                ///
                Text('NinePatchImage.asset 4, scale: 1.0'),
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
                SizedBox(height: 16),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
