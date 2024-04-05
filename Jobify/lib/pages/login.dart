import 'package:flutter/material.dart';
import 'package:vid_dowloader/components/glass.dart';
import 'package:vid_dowloader/components/logincomp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
         padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 25),
          
          height: double.infinity,
          width: double.infinity*2,
          decoration: const BoxDecoration(
            gradient: LinearGradient( begin: Alignment.topRight,
              end: Alignment.bottomRight,
              
              colors: [
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(0, 0, 0, 0.955),
                Color.fromRGBO(28, 28, 28, 1),
                Color.fromRGBO(53, 53, 33, 0.953),
                Color.fromRGBO(87, 81, 0, 0.848),
                Color.fromRGBO(201, 191, 0, 1),
                
              ],)
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hey !', style: TextStyle(fontSize:50, color: Colors.white, fontFamily: 'Amigo', fontWeight: FontWeight.w900, letterSpacing: 2,),),
                  SizedBox(height: 10,),
              Text('Login Now', style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Amigo', fontWeight: FontWeight.w900, letterSpacing: 2,),),
                ],
              ),
              SizedBox(
                height: 420,
                child: Glass(const LoginComp())),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account...?",style: TextStyle(color: Colors.white, fontFamily: 'Amigo',fontSize: 18 ), ),
                  TextButton(onPressed: (){}, child: const Text('Signup',style: TextStyle(color: Color.fromARGB(255, 5, 26, 0), fontFamily: 'Amigo',fontSize: 20 ))),
                ],
              ) 
          ],),
      ),
    );
  }
}