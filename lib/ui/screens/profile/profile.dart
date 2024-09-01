import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/auth/authentication.dart';

class profile extends StatefulWidget {
  const profile({super.key});
  // signout

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  // final user = FirebaseAuth.instance.currentUser!;
  void _showContributionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Daily Sports Contribution'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildContributionGraph(),
                SizedBox(height: 20),
                Text(
                  'You\'ve been actively participating in sports activities!',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContributionGraph() {
    final List<List<int>> contributions =
        List.generate(7, (i) => List.generate(12, (j) => (i + j) % 5));

    return Column(
      children: contributions.map((week) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: week.map((day) {
            return Container(
              margin: EdgeInsets.all(2),
              width: 15,
              height: 15,
              color: _getColorForContribution(day),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Color _getColorForContribution(int count) {
    switch (count) {
      case 0:
        return Colors.grey[200]!;
      case 1:
        return Colors.green[100]!;
      case 2:
        return Colors.green[300]!;
      case 3:
        return Colors.green[500]!;
      case 4:
        return Colors.green[700]!;
      default:
        return Colors.green[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    // final screenUtils = ScreenUtils(context);
    // signout
    void signUserOut() async {
      FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthenticationPage(),
        ),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().backgroundColour,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenheight * 0.02,
              // left: screenWidth * 0.02,
              // right: screenWidth * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: screenWidth * 0.4,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: appColors.primaryColour,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    height: screenWidth * 0.4,
                    width: screenWidth * 0.5,
                    decoration: BoxDecoration(
                        // color: appColors.primaryColour,
                        // borderRadius: BorderRadius.all(
                        //   Radius.circular(30),
                        // ),
                        ),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              // child: Text(
                              //   user.email!,
                              //   style: GoogleFonts.montserrat(
                              //     // fontWeight: FontWeight.bold,
                              //     fontSize: screenWidth * 0.07,
                              //     color: appColors.textColour,
                              //   ),
                              // ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Mobile:",
                                style: GoogleFonts.montserrat(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05,
                                  color: appColors.textColour,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              // child: Text(
                              //   "Email: " + user.email!,
                              //   style: GoogleFonts.montserrat(
                              //     // fontWeight: FontWeight.bold,
                              //     fontSize: screenWidth * 0.05,
                              //     color: appColors.textColour,
                              //   ),
                              // ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address: ",
                                style: GoogleFonts.montserrat(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05,
                                  color: appColors.textColour,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenheight * 0.03,
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
              bottom: screenheight * 0.03,
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => personalInfo(),
                //   ),
                // );
              },
              icon: Icon(
                Icons.edit,
                color: appColors.textColour,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: appColors.backgroundColour,
                foregroundColor: appColors.backgroundColour,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                elevation: 1,
              ),
              label: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Edit account details",
                  style: GoogleFonts.montserrat(
                    // fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                    color: appColors.textColour,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
          Container(
            height: screenheight * 0.1,
            width: screenWidth * 0.5,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.history,
                  color: appColors.textColour,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  foregroundColor: appColors.backgroundColour,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  elevation: 0,
                ),
                onPressed: () {
                  // signUserOut();
                },
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "History",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth / 22,
                      color: appColors.textColour,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
          Container(
            height: screenheight * 0.1,
            width: screenWidth * 0.5,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.reviews_outlined,
                  color: appColors.textColour,
                  size: screenWidth * 0.08,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  foregroundColor: appColors.backgroundColour,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  elevation: 0,
                ),
                onPressed: () {
                  // signUserOut();
                },
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reviews",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth / 22,
                      color: appColors.textColour,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
          Container(
            height: screenheight * 0.1,
            width: screenWidth * 0.5,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.grain_sharp,
                  color: appColors.textColour,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  foregroundColor: appColors.backgroundColour,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  elevation: 0,
                ),
                onPressed: () {
                  _showContributionDialog(context);
                },
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Graph",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth / 22,
                      color: appColors.textColour,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
          Container(
            height: screenheight * 0.1,
            width: screenWidth * 0.5,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.translate_outlined,
                  color: appColors.textColour,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  foregroundColor: appColors.backgroundColour,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  elevation: 0,
                ),
                onPressed: () {
                  // signUserOut();
                },
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   language",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth / 22,
                      color: appColors.textColour,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
          Container(
            height: screenheight * 0.1,
            width: screenWidth * 0.5,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.login_outlined,
                  color: appColors.textColour,
                  size: 40,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  foregroundColor: appColors.backgroundColour,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  elevation: 0,
                ),
                onPressed: () {
                  signUserOut();
                },
                label: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   Signout",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth / 22,
                      color: appColors.textColour,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 2,
              width: screenWidth * 0.4,
              color: appColors.textColour,
            ),
          ),
        ],
      ),
    );
  }
}
