import 'package:flutter/material.dart';

class HorizontalPadding extends Padding {
  HorizontalPadding({@required double padding, child: Widget})
      : super(padding: EdgeInsets.symmetric(vertical: padding), child: child);
}

class VerticalPadding extends Padding {
  VerticalPadding({@required double padding, child: Widget})
      : super(padding: EdgeInsets.symmetric(vertical: padding), child: child);
}

class BoxPadding extends Padding {
  BoxPadding({@required double padding, child: Widget})
      : super(padding: EdgeInsets.all(padding), child: child);
}

EdgeInsets vertical(double pad) => EdgeInsets.symmetric(vertical: pad);

EdgeInsets horizontal(double pad) => EdgeInsets.symmetric(horizontal: pad);

EdgeInsets box(double pad) => EdgeInsets.all(pad);

EdgeInsets right(double pad) => EdgeInsets.only(right: pad);

EdgeInsets left(double pad) => EdgeInsets.only(left: pad);

EdgeInsets top(double pad) => EdgeInsets.only(top: pad);

EdgeInsets bottom(double pad) => EdgeInsets.only(bottom: pad);

EdgeInsets only({
  left = 0.0,
  top = 0.0,
  right = 0.0,
  bottom = 0.0,
}) =>
    EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
