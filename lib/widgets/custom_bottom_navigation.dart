import 'package:flutter/material.dart';
import 'widgets.dart';

class _NavigationScope extends InheritedWidget {
  _NavigationScope({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final _CfNavigationBarState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      (oldWidget as _NavigationScope).state != state;
}

class CfNavigationBar extends StatefulWidget {
  CfNavigationBar({
    Key? key,
    required this.items,
    required this.controller,
    required this.curve,
    required this.duration,
    this.backgroundColor,
    this.circleColor,
    this.barColor,
  }) : super(key: key);

  final List<Widget> items;

  final PageController controller;

  final Color? backgroundColor;

  final Color? barColor;

  final Color? circleColor;

  final Curve curve;

  final Duration duration;

  static _CfNavigationBarState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_NavigationScope>()!.state;

  @override
  _CfNavigationBarState createState() => _CfNavigationBarState();
}

class _CfNavigationBarState extends State<CfNavigationBar>
    with TickerProviderStateMixin {
  /// Buradan [Path] cubicTo ya etki etemeliyiz. Pozisyonunu bar da olan iconlara tıklayarak
  /// Pozisyonunu değiştirmeliyiz ve bu animasyon halinde olmalı
  /// Buradan animasyon gönderilecek paint kısmında ise bu animasyon ile beraber pozisyon value değişikliği yapılacak.

  AnimationController? _animationController;

  int? _length;

  double? _position;

  void _checkControll() {
    _length = widget.items.length;
    _position = widget.controller.initialPage.toDouble();
  }

  @override
  void initState() {
    super.initState();
    _checkControll();
    _animationController = AnimationController(vsync: this, value: _position);
    _animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _NavigationScope(
      child: Stack(
        children: [
          Container(
            color: widget.backgroundColor ?? Colors.blue,
            width: size.width,
            height: 100.0,
            child: CustomPaint(
              painter: NavigationPaint(
                controller: widget.controller,
                color: widget.barColor,
                pageCount: 3,
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.items
                    .map(
                      (e) => CfAction(
                        child: e,
                        backgroundColor: widget.circleColor,
                        onPressed: (index) => print(index),
                        index: widget.items.indexOf(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
      state: this,
    );
  }
}
