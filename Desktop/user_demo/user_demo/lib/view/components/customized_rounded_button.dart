import 'package:flutter/material.dart';

class CustomizedRoundedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width, height;
  final bool isElevation;
  final BoxShadow? boxShadow;
  final VoidCallback onTap;

  const CustomizedRoundedButton(
      {super.key,
      required this.child,
      required this.color,
      this.width = 1,
      this.height = 1,
      this.isElevation = false,
      this.boxShadow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        width: width != 1 ? width : MediaQuery.of(context).size.width,
        height:
            height != 1 ? height : MediaQuery.of(context).size.height * 0.06,
        child: child,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(width != 1 && height != 1
                  ? width * height * 0.003
                  : MediaQuery.of(context).size.width *
                      MediaQuery.of(context).size.height *
                      0.06 *
                      0.003),
            ),
            boxShadow: [if (isElevation) boxShadow!]),
      ),
      onTap: onTap,
    );
  }
}
