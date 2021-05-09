import 'package:flutter/material.dart';

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
    /// also it has animation changes value.
  }

  /// Pageview Controller [PageController].
  ///
  /// for animation cirlce indicator.
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
    Path path = Path();
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

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, navigationPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
