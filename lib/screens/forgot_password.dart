import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Custom background color
  static const customBgColor = Color.fromARGB(255, 255, 255, 255);

  // Sign in button styles
  final ButtonStyle btnStyle = ElevatedButton.styleFrom(
    backgroundColor: MyColors.primary,
    elevation: 5.0,
    padding: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    textStyle: const TextStyle(
      fontSize: 18,
      fontFamily: 'GeneralSans',
      fontWeight: FontWeight.w500,
    ),
  );

  // Email input field widget
  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Registered Email',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'Enter your email',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: MyColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  //Sign in button widget
  Widget _buildPasswordResentButton() {
    //
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: btnStyle,
        onPressed: () => print('Reset link sent'),
        child: const Text('Send reset link'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.chevron_left,
            color: Color.fromARGB(221, 23, 23, 23),
            size: 35,
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 60.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.local_hospital,
                    color: MyColors.primary,
                    size: 60,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Book Nurse',
                    style: TextStyle(
                      color: MyColors.primary,
                      fontSize: 28.0,
                      fontFamily: 'GeneralSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      'Reset your password',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'GeneralSans',
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildEmailField(),
                          const SizedBox(height: 35.0),
                          _buildPasswordResentButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
