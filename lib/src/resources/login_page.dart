import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icab/src/commons/configs.dart';
import 'package:icab/src/commons/res/icab_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void onClickLogin() {
    print('click login');
  }

  void onTapSignUp() {
    print('tap signup');
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Center(
                  child: Container(
                    width: 195.05,
                    height: 80,
                    child: SvgPicture.asset('images/car_green.svg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: Configs.textSizeTitle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Login to continue using iCab',
                  style: TextStyle(fontSize: Configs.textSizeSubTitle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: 48,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: Configs.textSize, color: Colors.black),
                      icon: SvgPicture.asset('images/ic_mail.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: Configs.textSize, color: Colors.black),
                      icon: SvgPicture.asset('images/ic_lock.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(fontSize: Configs.textSize, color: ICabColors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: RaisedButton(
                      onPressed: this.onClickLogin,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      color: ICabColors.blue,
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: Configs.textSize),
                      ),
                    )),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'New user? ',
                      style: TextStyle(color: Colors.black, fontSize: Configs.textSize),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign up for a new account',
                            style:
                                TextStyle(fontSize: Configs.textSize, color: ICabColors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTapSignUp),
                      ]),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}