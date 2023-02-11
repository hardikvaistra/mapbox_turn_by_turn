import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../widgets/app_banner.dart';
import '../widgets/app_home_buttons.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 27.0,
            ),
            child: Row(
              children: const [
                Icon(Icons.local_hospital),
                SizedBox(width: 4),
                Text(
                  'Nurse@Home',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'GeneralSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Column(
          children: const <Widget>[
            AppBanner(),
            AppHomeButtons(),
          ],
        ));
  }
}
