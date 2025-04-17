import 'package:flutter/material.dart';
//import 'package:todo_app/HomeScreen.dart';
//import 'package:todoapp/ReuseableButton.dart';
import 'Homescreen.dart';
import 'ReuseableButton.dart';
import 'signupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainScreen(),

    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 90),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/todo.jpg'),
              ),
              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
        
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility_off),
        
                  hintText: 'Password',
        
                  hintStyle: const TextStyle(color: Colors.grey,
                      fontFamily: 'Montserrat'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password"),
                ),
              ),
              const SizedBox(height: 10),
        
        
              ReuseableButton(title: 'Sign in',
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const Homescreen()));
                },),
        
        
        
              const SizedBox(height: 7),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signupScreen()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.grey,fontSize: 20),
                    children: [
                      TextSpan(
                        text: ' Sign up',
                        style: TextStyle(color: Color(0xffF79E89),fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
