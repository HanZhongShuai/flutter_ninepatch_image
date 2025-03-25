

# ninepatch image for Flutter

TODO: flutter .9 image

**Screenshot** :   
![Screenshot](https://github.com/HanZhongShuai/flutter_ninepatch_image/blob/main/screenshot/screenshot1.png?raw=true)

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```yaml
dependencies:
  flutter_ninepatch_image: ^0.0.3
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
