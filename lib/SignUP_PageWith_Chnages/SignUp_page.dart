import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as st_validator;
import 'Widgets.dart';
import 'SignIn_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var val;
  static final userNameRegExp = RegExp(r'^[A-Za-z0-9_.-]+$');

  final _formKey = GlobalKey<FormState>();
  bool confirmMobile = false;
  void checkMobileOTP(String otp){
    setState(() {
      confirmMobile = true;
    });
  }

  void toggleMobile() {
    if (confirmMobile == false) {
      setState(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: Center(
                  child: Text(
                    'Enter the OTP',
                    style: TextStyle(
                      color: Color(0xff373D3F),
                    ),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 16,
                    style: TextStyle(
                        fontSize: 14
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),],
                ),
                actions: <Widget>[
                  FlatButton(
                    color: Color(0xff63E2E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: Color(0xff373D3F),
                      ),
                    ),
                    onPressed: () {
                      checkMobileOTP('otp');
                    },
                  )
                ],
              );
            });
      });
    } else {
      setState(() {
        checked = false;
      });
    }
  }


  bool checked = false;
  void toggle(bool check) {
    if (checked == false) {
      setState(() {
        checked = true;
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: Text(
                  'Enter the promo code',
                  style: TextStyle(
                    color: Color(0xff373D3F),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[TextField()],
                ),
                actions: <Widget>[
                  FlatButton(
                    color: Color(0xff63E2E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Color(0xff373D3F),
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              );
            });
      });
    } else {
      setState(() {
        checked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              height: height * 1.2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 20),
                      child: Container(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Color(0xff373D3F), fontSize: width * 0.09),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: textfield("Username"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a username';
                              }
                              if (!userNameRegExp.hasMatch(value)) {
                                return 'Only Alphanumerics, underscore or period, allowed';
                              }
                              if (value[0] == value[0].toUpperCase()) {
                                return 'First letter should not be uppercase in username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textfield("Phone Number"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a PhoneNumber';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: textfield("Email (Optional)"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter an email address';
                              }
                              if (st_validator.isEmail(value)) {
                                return 'Enter a valid email address';
                              }
                              if (value.split('@').length != 2) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: textfield("Password"),
                            validator: (String value) {
                              val = value;
                              if (value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 8) {
                                return 'Password must be greater than 8 alphabets';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: textfield("Confirm Password"),
                            validator: (String value) {
                              if (val != value) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          toggleMobile();
                          if (_formKey.currentState.validate()) ;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Color(0xff373D3F), fontSize: width * 0.05),
                        ),
                      ),
                      color: Color(0xff63E2E0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              color: Color(0xff373D3F), fontSize: width * 0.04),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff63E2E0),
                                fontSize: width * 0.04),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Color(0xff616161),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Color(0xff373D3F),
                              fontSize: width * 0.04,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xff616161),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width * 0.7,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('assets/images/google.jpg',
                                height: 50, width: 40),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                color: Color(0xff373D3F),
                                fontSize: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Got any promo/referral code? ',
                            style: TextStyle(
                              color: Color(0xff373D3F),
                            ),
                          ),
                          Checkbox(
                            value: checked,
                            onChanged: (bool value) {
                              toggle(value);
                            },
                            activeColor: Color(0xff616161),
                            checkColor: Colors.white,
                            tristate: false,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}