[![Pub Version](https://img.shields.io/pub/v/flutter_ninepatch_image?style=flat-square&logo=dart)](https://pub.dev/packages/flutter_ninepatch_image)
[![GitHub stars](https://img.shields.io/github/stars/hanzhongshuai/flutter_ninepatch_image?style=social)](https://github.com/hanzhongshuai/flutter_ninepatch_image)
![GitHub repo size](https://img.shields.io/github/repo-size/hanzhongshuai/flutter_ninepatch_image?style=flat-square)
[![Platforms](https://badgen.net/pub/flutter-platform/flutter_ninepatch_image)](https://pub.dev/packages/flutter_ninepatch_image)

# ninepatch image for Flutter

TODO: flutter .9 image

## Usage

```yaml
dependencies:
  flutter_ninepatch_image: ^1.0.0
```

```dart
final assetName = 'assets/test_ninepatch.9.png';
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
);
```

**Screenshot** :   
![Screenshot](https://github.com/HanZhongShuai/flutter_ninepatch_image/blob/main/screenshot/screenshot1.png?raw=true)
