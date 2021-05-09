# flutter_bottom_navigation

Bottom Navigation bar 

## Getting Started

```dart
#### -1 first icon position paint
 path.lineTo(size.width * -.05, 0);
    path.cubicTo(
      size.width * .0,
      size.height * .05,
      size.width * .0,
      size.height * 6 / 8,
      size.width * .1,
      size.height * 6 / 8,
    );
    path.cubicTo(
      size.width * .2,
      size.height * 6 / 8,
      size.width * .2,
      size.height * .05,
      size.width * .35,
      0,
    );
##### -2 second icon position paint
 path.lineTo(size.width * .05, 0);
    path.cubicTo(
      size.width * .2,
      size.height * .05,
      size.width * .2,
      size.height * 6 / 8,
      size.width * .3,
      size.height * 6 / 8,
    );
    path.cubicTo(
      size.width * .4,
      size.height * 6 / 8,
      size.width * .4,
      size.height * .05,
      size.width * .55,
      0,
    );
##### -3 third icon position paint
path.lineTo(size.width * .25, 0);
    path.cubicTo(
      size.width * .4,
      size.height * .05,
      size.width * .4,
      size.height * 6 / 8,
      size.width * .5,
      size.height * 6 / 8,
    );
    path.cubicTo(
      size.width * .6,
      size.height * 6 / 8,
      size.width * .6,
      size.height * .05,
      size.width * .75,
      0,
    );
##### -4 fourth icon position paint
path.lineTo(size.width * .45, 0);
    path.cubicTo(
      size.width * .6,
      size.height * .05,
      size.width * .6,
      size.height * 6 / 8,
      size.width * .7,
      size.height * 6 / 8,
    );
    path.cubicTo(
      size.width * .8,
      size.height * 6 / 8,
      size.width * .8,
      size.height * .05,
      size.width * .95,
      0,
    );
#### -5 fifth icon position paint
path.lineTo(size.width * .65, 0);
   path.cubicTo(
      size.width * .8,
      size.height * .05,
      size.width * .8,
      size.height * 6 / 8,
      size.width * .9,
      size.height * 6 / 8,
    );
    path.cubicTo(
      size.width * 1,
      size.height * 6 / 8,
      size.width * 1,
      size.height * .05,
      size.width * 1.1,
      0,
    );
```


```dart
    /// If click first ActionButton
    /// path.lineTo(size.width * [x],0) x  ==> -0.5
    /// also second ActionButton [x] ==> 0.5
    /// Other Actionbuttons [x] ==> increasing by two
    /// index - 0 [x] == -0.5
    /// index - 1 [x] ==  0.5
    /// index - 2 [x] ==  2.5
    /// index - 3 [x] ==  4.5
    /// index - 4 [x] ==  6.5
    path.lineTo(size.width * .05 /*[x]*/, 0);
    path.cubicTo(
      size.width * .2,
      size.height * .05, // constant
      size.width * .2,
      size.height * 6 / 8, // constant
      size.width * .3,
      size.height * 6 / 8, // constant
    );
    path.cubicTo(
      size.width * .4,
      size.height * 6 / 8, // constant
      size.width * .4,
      size.height * .05, // constant
      size.width * .55,
      0,
    );

    /// After every change position, here going to be constant.
    /// Therefor we don't change these values.
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, navigationPaint);
```

  - [path-lineTo](https://api.flutter.dev/flutter/dart-ui/Path/lineTo.html)
  - [path-cubicTo](https://api.flutter.dev/flutter/dart-ui/Path/cubicTo.html)

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
