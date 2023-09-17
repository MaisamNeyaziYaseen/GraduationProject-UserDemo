import 'package:flutter/material.dart';
import '../../../utils/ui_constants.dart';

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: UiConstants.sndColor,
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.5),
              bottomRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.5))),
    );
  }
}
