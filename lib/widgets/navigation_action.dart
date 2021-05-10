import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/widgets/widgets.dart';

abstract class ClickableActions extends StatelessWidget {
  ClickableActions({
    Key? key,
    required this.onPressed,
    required this.index,
    this.backgroundColor,
  }) : super(key: key);

  final Function(int) onPressed;

  final int index;

  final Color? backgroundColor;

  void _handlePosition(BuildContext context, int index) {
    onPressed.call(index);
    CfNavigationBar.of(context).changePositionSet(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePosition(context, index),
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.orange,
          shape: BoxShape.circle,
        ),
        child: buildAction(context),
      ),
    );
  }

  @protected
  Widget buildAction(BuildContext context);
}

class CfAction extends ClickableActions {
  /// Constructor [CfAction]
  CfAction({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.index,
    this.backgroundColor,
  }) : super(
            key: key,
            onPressed: onPressed,
            index: index,
            backgroundColor: backgroundColor);

  final Function(int) onPressed;

  final Widget child;

  final Color? backgroundColor;

  final int index;

  @override
  Widget buildAction(BuildContext context) => child;
}
