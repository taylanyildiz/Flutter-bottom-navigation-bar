import 'package:flutter/material.dart';

const x = 0.8;
const y = 0.0;

class NavigationPaint extends CustomPainter {
  /// Constructor NavigationPaint.
  NavigationPaint({
    required this.controller,
    this.pageCount,
    this.color,
    this.radius,
  })  : navigationPaint = Paint()
          ..color = color ?? Colors.orange
          ..style = PaintingStyle.fill,
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
    double c = 0;

    if (pageCount! == 4)
      c = -0.1;
    else if (pageCount! == 5) c = 1;

    final Offset center = size.center(Offset.zero);

    final radius = size.width / (2 * pageCount!);

    final space = -radius;

    final double totalWidth =
        (pageCount! * 2 * radius) + ((pageCount! - c) * space);

    final int pageIndex = _page.round();

    final double leftDot =
        (center.dx - (totalWidth / 2)) + (pageIndex * (2 * radius) + space);

    final double transition = _page - pageIndex;

    final positionLeft = leftDot + (transition * ((2 * radius) + space));

    final double positionRight = positionLeft + (2 * radius);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(positionLeft - radius * 2, 0);
    path.cubicTo(
      positionLeft - radius,
      size.height * y,
      positionLeft - radius,
      size.height * x,
      positionLeft,
      size.height * x,
    );

    path.cubicTo(
      positionRight - radius,
      size.height * x,
      positionRight - radius,
      size.height * y,
      positionRight,
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
