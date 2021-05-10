import 'package:flutter/material.dart';
import 'widgets.dart';

class _NavigationScope extends InheritedWidget {
  /// Constructor.
  _NavigationScope({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  /// InheritedWidget state.
  final CfNavigationBarState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      (oldWidget as _NavigationScope).state != state;
}

class CfNavigationBar extends StatefulWidget {
  CfNavigationBar({
    Key? key,
    required this.items,
    required this.curve,
    required this.duration,
    required this.onPressed,
    required this.controller,
    this.backgroundColor,
    this.circleColor,
    this.barColor,
  })  : assert(items.length >= 4 && items.length <= 5),
        super(key: key);

  /// [PageView] Controller need.
  ///
  /// Because ahimationChange with every page.
  final PageController controller;

  /// Bottom navigation buttons widget.
  ///
  /// May be at least 4 can be at most 5
  final List<Widget> items;

  /// BottomBar background line color
  final Color? backgroundColor;

  /// Bottombar foreground line color
  final Color? barColor;

  /// Button widgets background color
  final Color? circleColor;

  /// Change position animation curve
  /// have default curve [Curves.linear].
  final Curve curve;

  /// Change position animation duration
  /// have default value [Duration] seconds 1
  final Duration duration;

  /// Circlebutton click function
  /// returns int value  index.
  final Function(int) onPressed;

  /// Action Button click Inherited Widget call.
  static CfNavigationBarState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_NavigationScope>()!.state;

  @override
  CfNavigationBarState createState() => CfNavigationBarState();
}

class CfNavigationBarState extends State<CfNavigationBar>
    with TickerProviderStateMixin {
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
    print('didChangeDependecies');
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// Same values return because [PageController] don't chage
  }

  /// This method InheritedWidget calling [ClickableActions]
  /// return index button.
  void changePositionSet(int index) {
    widget.controller
        .animateToPage(index, duration: widget.duration, curve: widget.curve);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _NavigationScope(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: widget.backgroundColor ?? Colors.orange,
              width: size.width,
              height: 60.0,
              child: CustomPaint(
                painter: NavigationPaint(
                  color: widget.barColor,
                  controller: widget.controller,
                  pageCount: widget.items.length,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.items
                    .map(
                      (e) => CfAction(
                        child: e,
                        backgroundColor: widget.circleColor,
                        onPressed: (index) => widget.onPressed.call(index),
                        index: widget.items.indexOf(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      state: this,
    );
  }
}
