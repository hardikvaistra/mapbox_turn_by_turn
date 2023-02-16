 import 'package:flutter/material.dart';
 


class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key, required this.type}) : super(key: key);
  
  final InfoType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          getTitle(),
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<String>(
              future: _getPolicy(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "Please Wait...",
                  style: const TextStyle(fontSize: 18),
                );
              }),
        ),
      ),
    );
  }

  Future<String> _getPolicy() async {
    if (type == InfoType.privacy) {
      return  "Privacy Policy"; // getPrivacyPolicy();
    } else if (type == InfoType.faq) {
      return  "FAQ"; // getFAQ();
    } else if (type == InfoType.terms) {
      return  "Terms & Policy"; // getTermsPolicy();
    } else if (type == InfoType.aboutus) {
      return  "About Us"; // getAboutUs();
    } else if (type == InfoType.contactus) {
      return  "Contact Us"; // getContactUs();
    } else {
      return Future.value("Please wait...");
    }
  }

  String getTitle() {
    if (type == InfoType.privacy) {
      return "Privacy Policy";
    } else if (type == InfoType.faq) {
      return "Frequently Ask Question";
    } else if (type == InfoType.contactus) {
      return "Contact Us";
    } else if (type == InfoType.terms) {
      return "Terms & Conditions";
    } else if (type == InfoType.aboutus) {
      return "About Us";
    } else {
      return "Please wait...";
    }
  }
}

enum InfoType { aboutus, privacy, contactus, faq, terms }