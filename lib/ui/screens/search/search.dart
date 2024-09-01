import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/search/location.dart';
import 'package:sports_hub/ui/screens/search/nearby_search.dart';

class SearchPage extends StatefulWidget {
  get sport => _sportsDropdownValue;
  get radius => _radiusDropdownValue;

  // final String location;
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

const List<String> listSports = <String>[
  'Cricket',
  'Badminton',
  'Football',
  'Basketball',
  'Table Tennis'
];
String _sportsDropdownValue = listSports.first;

const List<String> listRadius = <String>[
  '1 km',
  '2 km',
  '5 km',
  '10 km',
  '20 km'
];
String _radiusDropdownValue = listSports.first;

class _SearchPageState extends State<SearchPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  // variable
  late String lat;
  late String long;
  String? locationMessage;
  bool locationLoaded = false;
  bool captionLoaded = false;

  // for location to work
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location services are dissabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('location Permission are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'locationpermission denied,  we cannot process request',
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    try {
      Position position = await getCurrentLocation();
      setState(
        () {
          lat = '${position.latitude}';
          long = '${position.longitude}';
          locationMessage = 'Latitude: $lat, Longitude: $long';
          locationLoaded = true;
        },
      );
    } catch (e) {
      print('Error loading location: $e');
    }
  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // Permission granted, proceed with accessing location
      print('Location permission granted.');
    } else if (status.isDenied) {
      // Permission denied, handle accordingly
      print('Location permission denied.');
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      openAppSettings();
    }
  }

  Widget build(BuildContext context) {
    // final appTextStyle = AppTextStyles();
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();

    // const List<String> listSports = <String>[
    //   'Cricket',
    //   'Badminton',
    //   'Football',
    //   'Basketball',
    //   'Table Tennis'
    // ];
    // String _sportsDropdownValue = listSports.first;

    // const List<String> listRadius = <String>[
    //   '1 km',
    //   '2 km',
    //   '5 km',
    //   '10 km',
    //   '20 km'
    // ];
    // String _radiusDropdownValue = listSports.first;

    return Scaffold(
      backgroundColor: appColors.backgroundColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenUtils.responsiveHeight(0.03),
            ),
            Container(
              height: screenUtils.responsiveHeight(0.06),
              width: screenUtils.responsiveWidth(0.9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.backgroundColour,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.search,
                      size: screenUtils.responsiveWidth(0.1),
                      color: appColors.textColour,
                    ),
                    Text(
                      "Search",
                      style: AppTextStyles.headline2(
                        context,
                        20,
                        appColors.textColour,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                color: appColors.primaryColour,
              ),
              // height: screenUtils.responsiveHeight(0.4),
              width: screenUtils.responsiveWidth(0.9),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sport  ",
                          style: AppTextStyles.headline2(
                            context,
                            20,
                            appColors.backgroundColour,
                          ),
                        ),
                        Icon(
                          Icons.sports_basketball_rounded,
                          color: appColors.backgroundColour,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: appColors.backgroundColour,
                          child: DropdownMenu<String>(
                            textStyle: AppTextStyles.headline2(
                              context,
                              12,
                              appColors.textColour,
                            ),
                            initialSelection: listSports.first,
                            onSelected: (String? value) {
                              // This is called when the user selects an item.
                              setState(
                                () {
                                  _sportsDropdownValue = value!;
                                },
                              );
                            },
                            dropdownMenuEntries:
                                listSports.map<DropdownMenuEntry<String>>(
                              (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtils.responsiveHeight(0.02),
                    ),
                    Row(
                      children: [
                        Text(
                          "Time  ",
                          style: AppTextStyles.headline2(
                            context,
                            20,
                            appColors.backgroundColour,
                          ),
                        ),
                        Icon(
                          Icons.timelapse_outlined,
                          color: appColors.backgroundColour,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: screenUtils.responsiveHeight(0.065),
                          width: screenUtils.responsiveWidth(0.33),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appColors.backgroundColour,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () async {
                              _loadLocation();
                              final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial,
                              );
                              if (timeOfDay != null) {
                                setState(() {
                                  selectedTime = timeOfDay;
                                });
                              }
                            },
                            child: Text(
                              "From",
                              style: AppTextStyles.headline2(
                                context,
                                15,
                                appColors.textColour,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenUtils.responsiveWidth(0.2),
                        ),
                        Text(
                          "${selectedTime.hour}:${selectedTime.minute}",
                          style: AppTextStyles.headline2(
                            context,
                            35,
                            appColors.backgroundColour,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenUtils.responsiveHeight(0.02),
                    ),
                    Row(
                      children: [
                        Text(
                          "Location  ",
                          style: AppTextStyles.headline2(
                            context,
                            20,
                            appColors.backgroundColour,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_searching_rounded,
                            color: appColors.backgroundColour,
                          ),
                        ),
                        SizedBox(
                          width: screenUtils.responsiveWidth(0.01),
                        ),
                        Column(
                          children: [
                            locationLoaded
                                ? Text(
                                    locationMessage!,
                                    style: AppTextStyles.headline2(
                                      context,
                                      20,
                                      appColors.backgroundColour,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      'Location...',
                                      style: AppTextStyles.headline2(
                                        context,
                                        20,
                                        appColors.backgroundColour,
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Search Radius",
                          style: AppTextStyles.headline2(
                            context,
                            20,
                            appColors.backgroundColour,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: appColors.backgroundColour,
                          child: DropdownMenu<String>(
                            textStyle: AppTextStyles.headline2(
                              context,
                              12,
                              appColors.textColour,
                            ),
                            initialSelection: listRadius.first,
                            onSelected: (String? value) {
                              // This is called when the user selects an item.
                              setState(
                                () {
                                  _radiusDropdownValue = value!;
                                },
                              );
                            },
                            dropdownMenuEntries:
                                listRadius.map<DropdownMenuEntry<String>>(
                              (String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtils.responsiveHeight(0.01),
                    ),
                    Container(
                      height: screenUtils.responsiveHeight(0.065),
                      width: screenUtils.responsiveWidth(0.33),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColors.accentColour,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            DialogRoute(
                              context: context,
                              builder: (context) => NearbySearch(),
                            ),
                          );
                        },
                        child: Text(
                          "FIND...",
                          style: AppTextStyles.headline2(
                            context,
                            15,
                            appColors.textColour,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "     SEARCH HISTORY  ",
                  style: AppTextStyles.headline1(context, 20, null),
                ),
                Icon(
                  Icons.history,
                  size: screenUtils.responsiveWidth(0.09),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: appColors.accentColour,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              height: screenUtils.responsiveHeight(0.2),
              width: screenUtils.responsiveWidth(0.9),
              child: ListView(
                children: [
                  Column(
                    children: [],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
