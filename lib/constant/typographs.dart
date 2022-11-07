import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/constant/colors.dart';

class AppTypographs {
  static TextStyle poppins = GoogleFonts.poppins();
  static final textHead = poppins.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 30,
    color: AppColors.colorHeadPrimary,
  );
  static final textSubHead = poppins.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColors.colorTextSecondary,
  );
}
