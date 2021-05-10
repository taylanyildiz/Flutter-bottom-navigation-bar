import 'package:flutter/material.dart';

const x = 0.75;
const y = 0.05;

class NavigationPaint extends CustomPainter {
  /// Constructor NavigationPaint.
  NavigationPaint({
    required this.controller,
    this.pageCount,
    this.color,
    this.radius,
  })  : navigationPaint = Paint()
          ..color = color ?? Colors.orange
          ..style = PaintingStyle.fill
          ..strokeWidth = 10.0,
        super(repaint: controller) {
    /// We have math equation for controll position.
    /// also it has animation for changes value.
  }

  /// Pageview Controller [PageController].
  /// for animation cirlce indicator.
  ///
  /// can't be null.
  final Listenable controller;

  /// Pageview [pageCount] how many have.
  final int? pageCount;

  /// Circle indicator color.
  final Color? color;

  /// Navigation background paint.
  final Paint navigationPaint;

  /// Indicator circle radius.
  final double? radius;

  @override
  void paint(Canvas canvas, Size size) {
    _drawback(canvas, size);
  }

  _drawback(Canvas canvas, Size size) {
    double _page;
    final _controller = (controller as PageController);
    if (_controller.hasClients && _controller.page != null) {
      _page = _controller.page!;
    } else {
      _page = _controller.initialPage.toDouble();
    }

    final center = size.center(Offset.zero);

    final pageIndexToLeft = _page.floor();

    final double leftDotX =
        (center.dx - (size.width / 2)) + (pageIndexToLeft * ((2 * 50.0) - 25));

    final double transitionPercent = _page - pageIndexToLeft;

    final double laggingLeftPositionPercent =
        (transitionPercent - 0.3).clamp(0.0, 1.3) / 0.7;

    final double positionLeftX =
        leftDotX + (laggingLeftPositionPercent * ((2 * 50.0) - 25));

    final double acceleratedRightPositionPercent =
        (transitionPercent / .5).clamp(0.0, 1.0);

    final double positionRightX = leftDotX +
        (acceleratedRightPositionPercent * ((2 * 50.0) - 25)) +
        (2 * 50);

    Path path = Path();
    path.lineTo(positionLeftX - 50, 0);
    path.cubicTo(
      positionLeftX + 15,
      size.height * y,
      positionLeftX,
      size.height * x,
      positionLeftX + 48,
      size.height * x,
    );
    path.cubicTo(
      positionRightX,
      size.height * x,
      positionRightX - 25,
      size.height * y,
      positionRightX + 40,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, navigationPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
