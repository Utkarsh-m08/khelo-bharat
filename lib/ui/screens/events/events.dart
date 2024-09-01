import 'package:flutter/material.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final List<Map<String, String>> events = [
    {
      'sport': 'Cricket',
      'time': '10:00 AM',
      'venue': 'Eden Gardens',
      'players': '8 players needed'
    },
    {
      'sport': 'Badminton',
      'time': '11:30 AM',
      'venue': 'K. D. Jadhav Indoor Hall',
      'players': '4 players needed'
    },
    {
      'sport': 'Marathon',
      'time': '6:00 AM',
      'venue': 'Marine Drive',
      'players': 'Unlimited'
    },
    {
      'sport': 'Tennis',
      'time': '4:00 PM',
      'venue': 'Wimbledon Park',
      'players': '2 players needed'
    },
    {
      'sport': 'Football',
      'time': '2:00 PM',
      'venue': 'Old Trafford',
      'players': '10 players needed'
    },
    {
      'sport': 'Cricket',
      'time': '10:00 AM',
      'venue': 'Eden Gardens',
      'players': '8 players needed'
    },
    {
      'sport': 'Badminton',
      'time': '11:30 AM',
      'venue': 'K. D. Jadhav Indoor Hall',
      'players': '4 players needed'
    },
    {
      'sport': 'Marathon',
      'time': '6:00 AM',
      'venue': 'Marine Drive',
      'players': 'Unlimited'
    },
    {
      'sport': 'Tennis',
      'time': '4:00 PM',
      'venue': 'Wimbledon Park',
      'players': '2 players needed'
    },
    {
      'sport': 'Football',
      'time': '2:00 PM',
      'venue': 'Old Trafford',
      'players': '10 players needed'
    },
    // Additional events
    {
      'sport': 'Basketball',
      'time': '8:00 PM',
      'venue': 'Staples Center',
      'players': '5 players needed'
    },
    {
      'sport': 'Table Tennis',
      'time': '3:00 PM',
      'venue': 'China Table Tennis Hall',
      'players': '2 players needed'
    },
    {
      'sport': 'Volleyball',
      'time': '7:00 PM',
      'venue': 'Beach Volleyball Arena',
      'players': '6 players needed'
    },
    {
      'sport': 'Golf',
      'time': '1:00 PM',
      'venue': 'Augusta National',
      'players': '1 player per group'
    },
    {
      'sport': 'Swimming',
      'time': '5:00 PM',
      'venue': 'Sydney Aquatic Centre',
      'players': 'Unlimited'
    },
    {
      'sport': 'Boxing',
      'time': '9:00 PM',
      'venue': 'Madison Square Garden',
      'players': '2 players needed'
    },
    {
      'sport': 'Wrestling',
      'time': '6:00 PM',
      'venue': 'Tokyo Dome',
      'players': '2 players needed'
    },
    {
      'sport': 'Cycling',
      'time': '7:00 AM',
      'venue': 'Tour de France Route',
      'players': 'Unlimited'
    },
    {
      'sport': 'Skiing',
      'time': '8:00 AM',
      'venue': 'Aspen Mountain',
      'players': 'Unlimited'
    },
    {
      'sport': 'Surfing',
      'time': '9:00 AM',
      'venue': 'Pipeline Beach',
      'players': 'Unlimited'
    },
    {
      'sport': 'Rock Climbing',
      'time': '10:00 AM',
      'venue': 'Yosemite National Park',
      'players': '2 players needed'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    return Scaffold(
      backgroundColor: appColors.backgroundColour,
      appBar: AppBar(
        backgroundColor: appColors.primaryColour,
        title: Column(
          children: [
            Text(
              'Nearby Events & Meetups',
              style: AppTextStyles.headline1(
                  context, 22, appColors.backgroundColour),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Card(
              color: appColors.secondaryColour,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['sport']!,
                      style: AppTextStyles.headline1(
                          context, 20, appColors.textColour),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Time: ${event['time']}',
                      style: AppTextStyles.headline2(
                          context, 15, appColors.textColour),
                    ),
                    Text('Venue: ${event['venue']}',
                        style: AppTextStyles.headline2(
                            context, 15, appColors.textColour)),
                    Text('Players: ${event['players']}',
                        style: AppTextStyles.headline2(
                            context, 15, appColors.textColour)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
