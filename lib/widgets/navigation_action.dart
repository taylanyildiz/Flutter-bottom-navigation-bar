import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/widgets/widgets.dart';

abstract class ClickableActions extends StatelessWidget {
  ClickableActions({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  void _handlePosition(BuildContext context, DragStartDetails position) {
    onPressed.call();
    CfNavigationBar.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (position) => _handlePosition(context, position),
      child: buildAction(context),
    );
  }

  @protected
  Widget buildAction(BuildContext context);
}

class CfAction extends ClickableActions {
  CfAction({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
        );

  final Function() onPressed;

  final Widget child;

  @override
  Widget buildAction(BuildContext context) => child;
}
