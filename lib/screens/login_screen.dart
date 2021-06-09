import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits/mixin/validation_mixin.dart';
import 'package:fruits/models/users.dart';
import 'package:fruits/services/auth.dart';
import 'package:fruits/services/db_provider.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Future<List<User>> _userList;
  final formKey = GlobalKey<FormState>();
  String password = '';
  String email = "";

  String userName = '';

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      // _userList = DbProvider.instance.getUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text(
              'Fruit Juice',
            ),
          ),
        ),
        body: Container(
          //margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(18.0),
          color: Colors.white,
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      userNameField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      emailField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      passwordField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      submitButton(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscuringCharacter: '*',
      obscureText: true,
      validator: validatePassword,
      onChanged: (String validator) {
        setState(() {
          password = validator;
        });
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget userNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: validateUserName,
      onChanged: (String validator) {
        setState(() {
          userName = validator;
        });
      },
      decoration: InputDecoration(
        labelText: 'UserName',
        prefixIcon: Icon(
          Icons.ac_unit_sharp,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (email) {
          if (email!.contains("@") && email.isEmpty) {
            return "Enter a valid email";
          }
          return null;
        },
        onChanged: (validator) {
          setState(() {
            email = validator;
          });
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Enter Email address',
          hintText: 'Enter email address',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
            side: MaterialStateProperty.all(BorderSide(
                width: 1.0, color: Colors.black, style: BorderStyle.solid)),
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange)),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();
            print('$email, $password ,$userName');
            AuthResult().signInWithEmail(email, password, userName);
          }
        },
        child: Text('Submit',
            style: TextStyle(
                color: Colors.black, fontSize: 18.0, fontFamily: "Pacifico")),
      ),
    );
  }
}
