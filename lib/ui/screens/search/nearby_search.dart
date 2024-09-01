import 'package:flutter/material.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/search/search.dart';

class NearbySearch extends StatefulWidget {
  const NearbySearch({super.key});

  // final String sport;
  // final String time;

  @override
  State<NearbySearch> createState() => _NearbySearchState();
}

class _NearbySearchState extends State<NearbySearch> {
  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: appColors.textColour,
          borderRadius: BorderRadius.circular(11),
        ),
        height: screenUtils.responsiveHeight(0.7),
        width: screenUtils.responsiveWidth(0.95),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/images/nearby_search.gif"),
            ),
            Container(
              color: appColors.primaryColour,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Finding Players Nearby",
                  style: AppTextStyles.headline1(
                    context,
                    40,
                    appColors.backgroundColour,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenUtils.responsiveHeight(0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "SPORT: ",
                  style: AppTextStyles.headline1(
                    context,
                    25,
                    appColors.backgroundColour,
                  ),
                ),
                Text(
                  const SearchPage().sport,
                  style: AppTextStyles.headline2(
                    context,
                    25,
                    appColors.backgroundColour,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "RADIUS: ",
                  style: AppTextStyles.headline1(
                    context,
                    25,
                    appColors.backgroundColour,
                  ),
                ),
                Text(
                  const SearchPage().radius,
                  style: AppTextStyles.headline2(
                    context,
                    25,
                    appColors.backgroundColour,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
