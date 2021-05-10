import 'package:flutter/material.dart';

const x = 0.9;
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
    path.lineTo(positionLeft - (radius / 5 - 3 * space), 0);

    path.cubicTo(
      positionLeft - space / 2,
      size.height * y,
      positionLeft + 2 * space,
      size.height * x,
      positionLeft,
      size.height * x,
    );
    path.cubicTo(
      positionRight + space / 2,
      size.height * x,
      positionRight + 2 * space,
      size.height * y,
      positionRight + (radius / 5 - space),
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
