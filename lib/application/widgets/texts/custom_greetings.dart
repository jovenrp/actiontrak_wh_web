import 'package:actiontrak_wh/application/utils/string_extensions.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CustomGreetings extends StatefulWidget {
  const CustomGreetings({super.key, this.nickname = ''});

  final String nickname;

  @override
  CustomGreetingsState createState() => CustomGreetingsState();
}

class CustomGreetingsState extends State<CustomGreetings> {
  String greetingMessage = 'Good Morning!';
  String userTimezone = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    tz.initializeTimeZones();
    _getUserTimezone();
    _getGreetingMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              text: '$greetingMessage, ${widget.nickname.capitalizeFirstofEach()}',
              fontSize: 22,
            ),
            const CustomText(
              text: 'What do you plan to do today?',
              fontSize: 16,
            )
          ],
        ),
      ],
    );
  }

  // Get current timezone
  void _getUserTimezone() {
    // Get the current location timezone
    final location = tz.getLocation('America/New_York'); // Fallback timezone
    final now = tz.TZDateTime.now(location);

    setState(() {
      userTimezone = now.timeZoneName;
    });
  }

  // Get dynamic greeting based on the time of day
  void _getGreetingMessage() {
    final now = DateTime.now();
    final hour = now.hour;

    setState(() {
      if (hour >= 0 && hour < 12) {
        greetingMessage = "Good Morning";
      } else if (hour >= 12 && hour < 17) {
        greetingMessage = "Good Afternoon";
      } else {
        greetingMessage = "Good Evening";
      }
    });
  }
}
