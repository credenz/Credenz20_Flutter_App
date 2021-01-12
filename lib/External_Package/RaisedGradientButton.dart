// class RaisedGradientButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//
//     );
//   }
// }
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final ShapeBorder shape;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.shape,
    this.width = double.infinity,
    this.height = double.infinity,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // shape: shape,
      decoration: BoxDecoration(gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ],
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
