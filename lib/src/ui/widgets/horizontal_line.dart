import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key key, Color color = Colors.black})
      : _color = color,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) => Container(height: 1.0, color: _color);
}
