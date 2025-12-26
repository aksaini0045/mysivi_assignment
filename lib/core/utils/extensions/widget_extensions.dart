import 'package:flutter/material.dart';

extension WidgetModifiers on Widget {
  /// Padding Extensions
  Widget paddingAll(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Margin Extensions
  Widget marginAll(double value) => Container(
    margin: EdgeInsets.all(value),
    child: this,
  );

  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Container(
        margin: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget marginSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Alignment Extensions
  Widget alignTopLeft() => Align(
    alignment: Alignment.topLeft,
    child: this,
  );

  Widget alignTopCenter() => Align(
    alignment: Alignment.topCenter,
    child: this,
  );

  Widget alignTopRight() => Align(
    alignment: Alignment.topRight,
    child: this,
  );

  Widget alignCenterLeft() => Align(
    alignment: Alignment.centerLeft,
    child: this,
  );

  Widget alignCenter() => Align(
    alignment: Alignment.center,
    child: this,
  );

  Widget alignCenterRight() => Align(
    alignment: Alignment.centerRight,
    child: this,
  );

  Widget alignBottomLeft() => Align(
    alignment: Alignment.bottomLeft,
    child: this,
  );

  Widget alignBottomCenter() => Align(
    alignment: Alignment.bottomCenter,
    child: this,
  );

  Widget alignBottomRight() => Align(
    alignment: Alignment.bottomRight,
    child: this,
  );
}
