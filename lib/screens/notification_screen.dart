import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static String id = 'notification_screen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 61.0),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Text(
                          "Notification",
                          style: kMenuTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ReusableBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 80.0),
              Text(
                "Today",
                style: kLabelTextStyle,
              ),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/earpod.png'),
                      ),
                      SizedBox(width: 9.0),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cancellation Request Accepted",
                              style: kCardTextStyle,
                            ),
                            SizedBox(height: 13.0),
                            Text(
                              "Your cacellation request has been approved. Order 200414FQTP7M8D has been cacelled. Refund amount of Rp. 500.000 will be credited to your credit card within 7 to 14 working days.",
                              style: kCardLabelTextStyle,
                            ),
                            SizedBox(height: 13.0),
                            Row(
                              children: [
                                Text(
                                  '10-6-2021',
                                  style: kCardLabelTextStyle,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  '09.00 PM',
                                  style: kCardLabelTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
