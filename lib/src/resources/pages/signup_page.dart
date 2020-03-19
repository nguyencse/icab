import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icab/src/commons/res/icab_colors.dart';
import 'package:icab/src/resources/app.dart';

import '../../commons/configs.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ICabColors.blue),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Center(
                  child: Container(
                    width: 195.05,
                    height: 80,
                    child: SvgPicture.asset('images/car_red.svg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Welcome Aboard!',
                  style: TextStyle(fontSize: Configs.textSizeTitle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Sign up with iCab in simple steps',
                  style: TextStyle(fontSize: Configs.textSizeSubTitle),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 48,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: Configs.textSize, color: Colors.black),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: SvgPicture.asset(
                        'images/ic_user.svg',
                        width: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 48,
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    labelStyle: TextStyle(
                        fontSize: Configs.textSize, color: Colors.black),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: SvgPicture.asset(
                        'images/ic_phone.svg',
                        width: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 48,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: Configs.textSize, color: Colors.black),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: SvgPicture.asset(
                        'images/ic_mail.svg',
                        width: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 48,
                child: TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: Configs.textSize, color: Colors.black),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: SvgPicture.asset(
                        'images/ic_lock.svg',
                        width: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: RaisedButton(
                      onPressed: onClickSignUp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      color: ICabColors.blue,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Configs.textSizeSubTitle),
                      ),
                    )),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'Already a user? ',
                      style: TextStyle(
                          fontSize: Configs.textSize, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Log in now',
                            style: TextStyle(
                                fontSize: Configs.textSize,
                                color: ICabColors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTapLogIn),
                      ]),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    MyApp.of(context).authBlock.dispose();
  }

  void onClickSignUp() {
    print('click signup');

    MyApp.of(context).authBlock.signUp(
        _nameController.text,
        _phoneController.text,
        _emailController.text,
        _passController.text, (uid) {
      MyApp.of(context).authBlock.createUser(
          uid,
          _nameController.text,
          _phoneController.text,
          _emailController.text,
          () => print('user created and added to DB'));
    }, (err) => print(err));
  }

  void onTapLogIn() {
    print('tap login');
    Navigator.pop(context);
  }
}
