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
    this.backgroundColor,
  }) : super(key: key);

  final List<Widget> items;

  final PageController controller;

  final Color? backgroundColor;

  static _CfNavigationBarState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_NavigationScope>()!.state;

  @override
  _CfNavigationBarState createState() => _CfNavigationBarState();
}

class _CfNavigationBarState extends State<CfNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CfNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void changePaintPosition(DragStartDetails position) {}

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
                      (e) => Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: e,
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
