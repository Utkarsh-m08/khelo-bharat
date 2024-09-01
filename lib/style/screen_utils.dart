import 'package:flutter/widgets.dart';

class ScreenUtils {
  
  final BuildContext context;

  ScreenUtils(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;
  
   // Define a method to calculate responsive width
  double responsiveWidth(double percentage) {
    return screenWidth * percentage;
  }

  // Define a method to calculate responsive height
  double responsiveHeight(double percentage) {
    return screenHeight * percentage;
  }

  // Define a method to calculate font size based on screen size
  double responsiveFontSize(double percentage) {
    return screenWidth * percentage;
  }

  // Define breakpoints for different screen sizes
  bool get isSmallScreen => screenWidth < 600;
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1024;
  bool get isLargeScreen => screenWidth >= 1024;
}
