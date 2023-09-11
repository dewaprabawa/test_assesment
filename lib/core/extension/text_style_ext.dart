import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

extension LightText on Text {
  Text toLightText({Color? color, double? fontSize}) => Text(
        data ?? "",
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.w300, color: color, fontSize: fontSize),
      );
}

extension NormalText on Text {
  Text toNormalText({Color? color, double? fontSize}) => Text(
        data ?? "",
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500, color: color, fontSize: fontSize),
      );
}

extension SemiBoldText on Text {
  Text toSemiBoldText({Color? color, double? fontSize}) => Text(
        data ?? "",
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.w600, color: color, fontSize: fontSize),
      );
}

extension BoldText on Text {
  Text toBoldText({Color? color, double? fontSize}) => Text(
        data ?? "",
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.w700, color: color, fontSize: fontSize),
      );
}


 Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // Alpha (fully opaque)
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}