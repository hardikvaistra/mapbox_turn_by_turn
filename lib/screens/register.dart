import 'package:flutter/material.dart';
import 'login.dart';
import '../styles/colors.dart';
import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Custom background color
  static const customBgColor = Color.fromARGB(255, 255, 255, 255);

  // Note: This is a form key which is used to hold the state of our form and this is the recommended way to do so.
  bool _rememberMe = false;

  // Sign in button styles
  final ButtonStyle btnStyle = ElevatedButton.styleFrom(
    backgroundColor: MyColors.primary,
    elevation: 5.0,
    padding: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    textStyle: const TextStyle(
        fontSize: 18, fontFamily: 'GeneralSans', fontWeight: FontWeight.w500),
  );

  var isHidden = false;

  // Full name input field widget
  Widget _buildFullNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'Enter full name',
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

  // Email input field widget
  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
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

  // Password input field widget
  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: isHidden,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.lock, color: Colors.black87),
        hintText: 'Enter your password',
        fillColor: Colors.white,
        suffixIcon: InkWell(
          onTap: () => setState(() => isHidden = !isHidden),
          child: Icon(Icons.remove_red_eye, color: MyColors.primary),
        ),
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

  // Login instead button widget
  Widget _buildLoginInsteadButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Login(),
          ));
        },
        // contentPadding: EdgeInsets.only(right: 0.0),
        child: const Text('Already have an account? Login instead',
            style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'GeneralSans',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(221, 23, 23, 23))),
      ),
    );
  }

  // Remember me checkbox widget
  Widget _buildRememberMeCheckBox() {
    return Row(
      children: <Widget>[
        Theme(
          data: ThemeData(
              unselectedWidgetColor: const Color.fromARGB(255, 177, 177, 177)),
          child: Checkbox(
            value: _rememberMe,
            checkColor: Colors.white,
            activeColor: const Color.fromARGB(221, 23, 23, 23),
            onChanged: (bool? value) {
              setState(() {
                _rememberMe = value!;
              });
            },
          ),
        ),
        const Text('Remember me',
            style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'GeneralSans',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(221, 23, 23, 23)))
      ],
    );
  }

  // Sign in button widget
  Widget _buildSignInButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: btnStyle,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Home(),
        )),
        child: const Text('Join now'),
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
          onPressed: () => Navigator.of(context).pop(),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
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
                    'Nurse@Home',
                    style: TextStyle(
                      color: MyColors.primary,
                      fontSize: 28.0,
                      fontFamily: 'GeneralSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40.0),
                    child: Text(
                      'Register Your Account',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'GeneralSans',
                        fontSize: 22.0,
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
                          _buildFullNameField(),
                          const SizedBox(height: 20.0),
                          _buildEmailField(),
                          const SizedBox(height: 20.0),
                          _buildPasswordField(),
                          _buildRememberMeCheckBox(),
                          const SizedBox(height: 20.0),
                          _buildSignInButton(),
                          const SizedBox(height: 35.0),
                          _buildLoginInsteadButton(),
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
