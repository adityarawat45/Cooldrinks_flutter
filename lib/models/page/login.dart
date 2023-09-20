// ignore_for_file: camel_case_types

// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/routes.dart';

import 'package:velocity_x/velocity_x.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // ignore: override_on_non_overriding_member
  String username = '';
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(milliseconds: 900));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, Routes.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  // ignore: annotate_overrides
  @override
  Widget build(BuildContext context) {
    return Container(
      // key: _formKey,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/colddrink.jpg"),
              fit: BoxFit.cover),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 212, 210, 210),
              Color.fromARGB(255, 0, 0, 0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(145, 8, 8, 45),
        body: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                200.heightBox,
                SizedBox(
                  child: Center(
                    child: Text(
                      "Welcome $username",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(93, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: Expanded(
                      child: TextFormField(
                        // textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.start,

                        style: const TextStyle(
                            color: Colors.white, decorationColor: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.profile_circled),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          border: InputBorder.none,
                          hintText: ("Username"),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username is required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          username = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(93, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.white, decorationColor: Colors.black),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),

                        hintText: ("Enter Password"),
                        // labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password can not be shorter than 6 digits";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () => movetohome(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: changebutton ? 45 : 140,
                    height: 40,

                    // color: Colors.lime,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // shape: changebutton ? BoxShape.circle : BoxShape.rectangle,
                      color: Colors.yellow,
                      // borderRadius: BorderRadius.circular(15),
                      borderRadius: changebutton
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(10),
                    ),

                    // ignore: prefer_const_constructors
                    child: changebutton
                        ? const Icon(Icons.done)
                        : const Text(
                            "Login",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Signing up is temporarily unavailable"
                              .text
                              .make()));
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.white))),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
