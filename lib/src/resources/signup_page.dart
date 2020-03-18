import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icab/src/blocs/auth_bloc.dart';
import 'package:icab/src/commons/res/icab_colors.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  AuthBloc _authBloc = AuthBloc();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  void onClickSignUp() {
    print('click signup');
    _authBloc.signUp(_nameController.text, _phoneController.text, _emailController.text, _passController.text, () {
      print('sign up success');
    });
  }

  void onTapLogIn() {
    print('tap login');
    Navigator.pop(context);
  }

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
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Sign up with iCab in simple steps',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: StreamBuilder(
                    stream: _authBloc.authStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          errorText: null,
                          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                          icon: SvgPicture.asset('images/ic_user.svg'),
                          border: InputBorder.none,
                        ),
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      icon: SvgPicture.asset('images/ic_phone.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      icon: SvgPicture.asset('images/ic_mail.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      icon: SvgPicture.asset('images/ic_lock.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'Already a user? ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Log in now',
                            style:
                                TextStyle(fontSize: 18, color: ICabColors.blue),
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
}
