import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/auth/login.dart';
import 'package:sports_hub/ui/screens/home/nav_bar.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    // final AppTextStyle = AppTextStyles();
    void login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavBar(),
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          width: screenUtils.responsiveWidth(0.8),
          height: screenUtils.responsiveHeight(0.95),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    size: screenUtils.responsiveHeight(0.15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "GET STARTED!",
                    style: AppTextStyles.headline1(context, 38, null),
                  ),
                ],
              ),
              SizedBox(
                height: screenUtils.responsiveHeight(0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenUtils.responsiveWidth(0.33),
                    width: screenUtils.responsiveWidth(0.33),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: appColors.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.login,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.secondaryColour,
                          ),
                          Text(
                            "login",
                            style: AppTextStyles.headline1(
                              context,
                              15,
                              appColors.secondaryColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenUtils.responsiveWidth(0.33),
                    width: screenUtils.responsiveWidth(0.33),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: appColors.secondaryColour,
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
                            Icons.new_label_outlined,
                            size: screenUtils.responsiveHeight(0.1),
                            color: appColors.secondaryColour,
                          ),
                          Text(
                            "Register",
                            style: AppTextStyles.headline1(
                              context,
                              15,
                              appColors.secondaryColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenUtils.responsiveHeight(0.01),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_left,
                      color: appColors.textColour,
                      size: screenUtils.responsiveWidth(0.15),
                    ),
                    onPressed: () {},
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
