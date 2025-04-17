import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoappflutter/ReuseableButton.dart';
import 'package:todoappflutter/loginscreen.dart';

class next extends StatefulWidget {
  const next({super.key});

  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:  Center(
        child: Column(

          children: [
            SizedBox(height: 140,),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Text('Your Account is Created',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
              ),

            ),
            SizedBox(height: 30,),
            ReuseableButton(title: 'Sign in', onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> MainScreen()));
            })
          ],
        ),
      ),
    );
  }
}
