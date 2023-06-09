import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import '../constant.dart';

class Utils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: whiteColor,
          ),
          message: message,
          duration: const Duration(seconds: 2),
          // title: title,
        )..show(context));
  }
  //
}
