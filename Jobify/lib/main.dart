import 'package:flutter/material.dart';
import 'package:vid_dowloader/authenticate/auth_google.dart';
import 'package:vid_dowloader/pages/entry.dart';
import 'package:vid_dowloader/pages/home.dart';
import 'package:vid_dowloader/pages/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( MaterialApp(
    home: StreamBuilder(stream:AuthGoogle().authChanges , builder:(context,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child:SpinKitPulsingGrid(
              color: Colors.white,
               ) ,
          );
        }
        if(snapshot.hasData){
          return const Home();
        }
        return const EntryScreen();
      }),
    routes: {
      '/entry':(context) => const EntryScreen()
      ,
      '/login':(context) => const Login(),
      '/home':(context) => const Home(),
    },
    debugShowCheckedModeBanner: false,
  ));
}



