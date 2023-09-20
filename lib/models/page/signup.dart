// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/routes.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

bool changebutton = false;

class _signuppageState extends State<signuppage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Fresh Juice!!",
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text("is waiting for you",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter full name",
              labelText: "Your name",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter mobile no.",
              labelText: "Phone no.",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter email address",
              labelText: "E-mail Id",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Create password",
              labelText: "Enter password",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () async {
            setState(() {
              changebutton = true;
            });
            await Future.delayed(Duration(seconds: 1));
            Navigator.pushNamed(context, Routes.homeroute);
            setState(() {
              changebutton = false;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: changebutton ? 45 : 100,
            height: 40,
            alignment: Alignment.center,
            child: changebutton
                ? Icon(Icons.done)
                : Text("Continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    )),
            decoration: BoxDecoration(
                borderRadius: changebutton
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(10),
                color: Colors.orangeAccent),
          ),
        ),

        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, Routes.homeroute);
        //     },
        //     child: Text("Continue"))
      ]),
    );
  }
}
