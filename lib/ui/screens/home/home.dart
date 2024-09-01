import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/home/top_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    return Scaffold(
      backgroundColor: AppColors().backgroundColour,
      body: Center(
        child: Container(
          width: screenUtils.responsiveWidth(0.9),
          child: ListView(
            children: [
              SizedBox(
                height: screenUtils.responsiveHeight(0.02),
              ),
              Text(
                'KHELO',
                style: AppTextStyles.headline1(
                  context,
                  50,
                  appColors.textColour,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: screenUtils.responsiveHeight(0.05)),
                child: Text(
                  'BHARAT',
                  style: GoogleFonts.montserrat(
                    height: 0.35,
                    fontWeight: FontWeight.w500,
                    fontSize: screenUtils.responsiveFontSize(0.2),
                    color: appColors.textColour,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: screenUtils.responsiveHeight(0.3),
                width: screenUtils.responsiveWidth(0.9),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/badminton.jpg"),
                        ),
                      ),
                      child: Image.asset("assets/images/badminton.jpg"),
                    ),
                    SizedBox(
                      width: screenUtils.responsiveWidth(0.02),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/images/basketball.jpg"),
                    ),
                    SizedBox(
                      width: screenUtils.responsiveWidth(0.02),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/images/cricket.jpg"),
                    ),
                    SizedBox(
                      width: screenUtils.responsiveWidth(0.02),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/images/football.jpg"),
                    ),
                    SizedBox(
                      width: screenUtils.responsiveWidth(0.02),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/images/table_tennis.jpg"),
                    ),
                    SizedBox(
                      width: screenUtils.responsiveWidth(0.02),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenUtils.responsiveHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenUtils.responsiveWidth(0.4),
                    width: screenUtils.responsiveWidth(0.4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          DialogRoute(
                            context: context,
                            builder: (context) => TopPlayer(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.leaderboard,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.backgroundColour,
                          ),
                          Text(
                            "Top Players",
                            style: AppTextStyles.headline1(
                              context,
                              15,
                              appColors.backgroundColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenUtils.responsiveWidth(0.4),
                    width: screenUtils.responsiveWidth(0.4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NavBar(),
                        //   ),
                        // );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.verified_user,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.backgroundColour,
                          ),
                          Text(
                            "Gov. Events",
                            style: AppTextStyles.headline1(
                              context,
                              15,
                              appColors.backgroundColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenUtils.responsiveWidth(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenUtils.responsiveWidth(0.4),
                    width: screenUtils.responsiveWidth(0.4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sports_cricket_rounded,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.backgroundColour,
                          ),
                          Text(
                            "Turf Booking",
                            style: AppTextStyles.headline1(
                              context,
                              13,
                              appColors.backgroundColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenUtils.responsiveWidth(0.4),
                    width: screenUtils.responsiveWidth(0.4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NavBar(),
                        //   ),
                        // );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.groups_2,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.backgroundColour,
                          ),
                          Text(
                            "Group Chat",
                            style: AppTextStyles.headline1(
                              context,
                              15,
                              appColors.backgroundColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
