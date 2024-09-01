import 'package:flutter/material.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // List to hold events
  List<Map<String, String>> events = [
    {
      'sport': 'Cricket',
      'time': '10:00 AM',
      'venue': 'Eden Gardens',
      'players': '8 players needed'
    },
    // Add initial events here...
  ];

  // Controllers for user input
  final _timeController = TextEditingController();
  final _venueController = TextEditingController();
  final _playersController = TextEditingController();

  String? _selectedSport;

  // List of sports for dropdown
  final List<String> sports = [
    'Cricket',
    'Badminton',
    'Marathon',
    'Tennis',
    'Football',
    'Basketball',
    'Table Tennis',
    'Volleyball',
    'Cycling',
  ];

  void _addEvent() {
    if (_selectedSport != null &&
        _timeController.text.isNotEmpty &&
        _venueController.text.isNotEmpty &&
        _playersController.text.isNotEmpty) {
      setState(() {
        events.add({
          'sport': _selectedSport!,
          'time': _timeController.text,
          'venue': _venueController.text,
          'players': _playersController.text,
        });
        // Clear input fields
        _timeController.clear();
        _venueController.clear();
        _playersController.clear();
        _selectedSport = null;
      });
    } else {
      // Show an error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    final appColors = AppColors();
    return Scaffold(
      backgroundColor: appColors.backgroundColour,
      appBar: AppBar(
        backgroundColor: appColors.primaryColour,
        title: Text(
          'Nearby Events & Meetups',
          style: AppTextStyles.headline1(
            context,
            22,
            appColors.backgroundColour,
          ),
        ),
      ),
      body: Column(
        children: [
          // Form for adding events
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedSport,
                  hint: Text(
                    'Select Sport',
                    style: AppTextStyles.headline2(
                      context,
                      20,
                      appColors.textColour,
                    ),
                  ),
                  items: sports.map((sport) {
                    return DropdownMenuItem(
                      value: sport,
                      child: Text(sport),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSport = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(labelText: 'Time'),
                  style: AppTextStyles.headline2(
                    context,
                    20,
                    appColors.textColour,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _venueController,
                  decoration: InputDecoration(labelText: 'Venue'),
                  style: AppTextStyles.headline2(
                    context,
                    20,
                    appColors.textColour,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _playersController,
                  decoration: InputDecoration(labelText: 'Players Requirement'),
                  style: AppTextStyles.headline2(
                    context,
                    20,
                    appColors.textColour,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.primaryColour,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: _addEvent,
                  child: Text(
                    'Add Event',
                    style: AppTextStyles.headline2(
                      context,
                      20,
                      appColors.backgroundColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // List of events
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Card(
                  color: appColors.primaryColour,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['sport']!,
                          style: AppTextStyles.headline1(
                            context,
                            20,
                            appColors.backgroundColour,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text('Time: ${event['time']}',
                            style: AppTextStyles.headline2(
                              context,
                              15,
                              appColors.backgroundColour,
                            )),
                        Text(
                          'Venue: ${event['venue']}',
                          style: AppTextStyles.headline2(
                            context,
                            15,
                            appColors.backgroundColour,
                          ),
                        ),
                        Text(
                          'Players: ${event['players']}',
                          style: AppTextStyles.headline2(
                            context,
                            15,
                            appColors.backgroundColour,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PostPage(),
  ));
}
