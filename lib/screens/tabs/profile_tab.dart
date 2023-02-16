import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String name = 'Guest Account';

  @override
  Widget build(BuildContext context) {
    // return _buildLogoutDefaultColumn();
    return Scaffold(
      backgroundColor: MyColors.bglight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 65,
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(color: MyColors.primary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: MyColors.primary,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const InformationScreen(title: 'Settings'),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/person.jpeg"),
          ),
          const SizedBox(height: 10),
          Text(
            "Boe Jiden",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: MyColors.header01),
          ),
          const SizedBox(height: 20),
          _buttonsListContainer(
            Column(
              children: [
                SettingsListItem(
                  onTap: () {},
                  first: true,
                  text: "View Profile",
                ),
                SettingsListItem(
                  onTap: () {},
                  text: "Edit Profile",
                ),
                SettingsListItem(
                  onTap: () {},
                  text: "Edit Patient Details",
                ),
              ],
            ),
          ),
          _buttonsListContainer(Column(
            children: [
              SettingsListItem(
                text: 'About Us',
                arrow: true,
                first: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        const InformationScreen(title: 'About Us'),
                  ),
                ),
              ),
              SettingsListItem(
                text: 'Contact Us',
                arrow: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        const InformationScreen(title: 'Contact Us'),
                  ),
                ),
              ),
              SettingsListItem(
                text: 'FAQ',
                arrow: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const InformationScreen(title: 'FAQ'),
                  ),
                ),
              ),
              SettingsListItem(
                text: 'Privacy Policy',
                arrow: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        const InformationScreen(title: 'Privacy Policy'),
                  ),
                ),
              ),
              SettingsListItem(
                text: 'Terms and Conditions',
                arrow: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        const InformationScreen(title: 'Terms and Conditions'),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  _buttonsListContainer(Widget body) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10, width: 1.0),
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFFCFDCE7),
            blurRadius: 3.0,
            offset: Offset(0.2, 0.2),
          ),
        ],
      ),
      child: body,
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final String text;
  final bool arrow;
  final bool first;
  final Color? color;
  final Function()? onTap;

  const SettingsListItem({
    Key? key,
    this.text = "",
    this.arrow = false,
    this.color,
    this.first = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !first
                ? Divider(
                    thickness: 1,
                    color: Theme.of(context).dividerColor,
                    height: 0,
                  )
                : Container(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: color ?? MyColors.bg01,
                      fontSize: 18,
                    ),
                  ),
                  arrow
                      ? Icon(
                          Icons.chevron_right,
                          color: color ?? Colors.black38,
                        )
                      : Container()
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class InformationScreen extends StatefulWidget {
  final String title;
  const InformationScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 1,
        toolbarHeight: 65,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 28),
          onPressed: Navigator.of(context).pop,
        ),
        foregroundColor: MyColors.bg01,
        backgroundColor: Colors.white,
      ),
    );
  }
}
