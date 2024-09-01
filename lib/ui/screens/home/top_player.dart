import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';

class TopPlayer extends StatefulWidget {
  const TopPlayer({super.key});

  @override
  State<TopPlayer> createState() => _TopPlayerState();
}

class _TopPlayerState extends State<TopPlayer> {
  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    return Dialog(
      backgroundColor: appColors.primaryColour,
      child: Column(
        children: [
          Icon(
            Icons.leaderboard,
            size: screenUtils.responsiveHeight(0.2),
            color: appColors.backgroundColour,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              "TOP",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: screenUtils.responsiveFontSize(0.26),
                color: appColors.backgroundColour,
                height: 0.7,
                letterSpacing: 0,
              ),
            ),
          ),
          Text(
            "PLAYERS",
            style: AppTextStyles.headline1(
              context,
              20,
              appColors.backgroundColour,
            ),
          ),
        ],
      ),
    );
  }
}
