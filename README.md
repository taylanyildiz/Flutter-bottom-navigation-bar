# flutter_bottom_navigation

Bottom Navigation bar Animation.

### Some animation doc video
 - [painter-animation](https://www.youtube.com/watch?v=yyHhloFMNNA&t=2822s)
 - [drawer-animation](https://www.youtube.com/watch?v=1KurAaGLwHc&t=700s)


### 
|             App Home               |
:----------------------------------: |
| <a  target="_blank"><img src="https://user-images.githubusercontent.com/37551474/117642806-69996680-b190-11eb-9009-5ac617ba58b6.gif" width="200"></a>|

## Github
 - [taylanyildz](https://github.com/taylanyildiz)
## Linkedin
 - [taylanyildz](https://www.linkedin.com/in/taylan-yıldız-02225a158)
### How To Use
 - [home_screen](https://github.com/taylanyildiz/Flutter-bottom-navigation-bar/blob/master/lib/screens/home_screen.dart)
```dart

    PageController? _controller;

    @override
    void initState() {
      super.initState();
      _controller = PageController(initialPage: 2);
    }

    PageView.builder(
            controller: _controller,
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  '$index Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CfNavigationBar(
        controller: _controller!,
        onPressed: (index) => print(index),
        backgroundColor: Colors.blue,
        barColor: Colors.orange,
        circleColor: Colors.orange,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInQuad,
        items: [
          Icon(
            Icons.person,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.access_alarm,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.notification_important,
            size: 30.0,
            color: Colors.white,
          ),
        ],
      ),

```


### Math...
###
The mathematical values of each painter position are given below respectively, and a mathematical formula should be derived based on these values. The animation transition is not forgotten.
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
    path.lineTo(size.width * .7 /*[x]*/, 0);
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
## Painter Methods 

  - [path-lineTo](https://api.flutter.dev/flutter/dart-ui/Path/lineTo.html)
  - [path-cubicTo](https://api.flutter.dev/flutter/dart-ui/Path/cubicTo.html)
## Getting Started



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
