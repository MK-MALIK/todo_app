import 'package:flutter/material.dart';
import 'package:todoappflutter/ReuseableButton.dart';
import 'package:todoappflutter/loginscreen.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final String name= 'Muhammad Khalil';
  final String email= 'mkmalik0000@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(

          alignment: Alignment.topLeft,
          child: Text(

            'TO DO LIST',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffF79E89),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings), iconSize: 40),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 85,),
              Image.asset('assets/images/rafiki.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,

              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Full Name',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  ),),

                  Text(name,
                  style: TextStyle(
                    color: Color(0xffF79E89),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  const Text('Email',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                    ),),

                  Text(email,
                    style: const TextStyle(
                        color: Color(0xffF79E89),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Password',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                    ),),

                  Text('Change Password',
                    style: TextStyle(
                        color: Color(0xffF79E89),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              ReuseableButton(title: 'Log Out', onPressed: (){
                 Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (context) =>
                         const MainScreen()), (route)=>false);
                 //Remove all screen and jump toh the login screen


              })
            ],

          ),

        ),

      ),
    );
  }
}
