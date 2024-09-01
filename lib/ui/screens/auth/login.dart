import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/auth/authentication.dart';
import 'package:sports_hub/ui/screens/home/nav_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // variable

  // text controllers
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    // size variable
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    // register
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

    // signout
    // void signUserOut() async {
    //   FirebaseAuth.instance.signOut();
    // }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: appColors.primaryColour,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Align(
              alignment: Alignment(0, -0.2),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      child: Text(
                        "Login here!",
                        style: GoogleFonts.montserrat(
                          fontSize: screenWidth / 12,
                          fontWeight: FontWeight.bold,
                          color: appColors.backgroundColour,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: appColors.backgroundColour,
                            ),
                          ),
                          fillColor: appColors.backgroundColour,
                          focusColor: appColors.backgroundColour,
                          labelText: "Email",
                          helperText: '',
                          filled: true,
                        ),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 20,
                          color: appColors.textColour,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                        bottom: 0,
                      ),
                      child: TextField( 
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: appColors.textColour,
                            ),
                          ),
                          fillColor: appColors.backgroundColour,
                          focusColor: appColors.backgroundColour,
                          labelText: "Password",
                          helperText: '',
                          filled: true,
                        ),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 20,
                          color: appColors.primaryColour,
                        ),
                      ),
                    ),
                    Container(
                      height: screenWidth / 7,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          color: appColors.textColour,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {
                          login();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.montserrat(
                            // fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 15,
                            color: appColors.backgroundColour,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Text(
                              "No Account?",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenheight / 40,
                                color: appColors.backgroundColour,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthenticationPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenheight / 35,
                                  color: appColors.textColour,
                                ),
                              ),
                            ),
                            Text(
                              "Here",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenheight / 40,
                                color: appColors.backgroundColour,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
