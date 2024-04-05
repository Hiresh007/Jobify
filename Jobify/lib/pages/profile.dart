import 'package:flutter/material.dart';
import 'package:vid_dowloader/authenticate/auth_google.dart';
import 'package:vid_dowloader/constants/filterconstants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthGoogle _authGoogle = AuthGoogle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
       appBar:PreferredSize(
        preferredSize: const Size.fromHeight(155),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(260),
                  bottomRight: Radius.circular(260))),
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                   Column(
                     children: [
                       Container(
                        padding: const EdgeInsets.all(8),
                      
                        decoration: BoxDecoration(border: Border.all(width: 1,color: const Color.fromRGBO(240, 221, 9, 0.7)),borderRadius: BorderRadius.circular(80)),
                        child: CircleAvatar(backgroundImage: NetworkImage(_authGoogle.user.photoURL!),radius: 55,)),
                     ],
                   ),

            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 15,),
                Text(_authGoogle.user.displayName!, style: const TextStyle(fontFamily: 'Amigo', fontSize: 28,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w500,letterSpacing: 1.1),),
                const SizedBox(height: 5,),
                Text(_authGoogle.user.email!, style: const TextStyle(fontFamily: 'Amigo', fontSize: 18,color: Color.fromARGB(229, 158, 158, 158), fontWeight: FontWeight.w100,letterSpacing: 1.1),),
                Container(width: 150,height: 1.1,color: const Color.fromARGB(255, 88, 88, 88),margin: const EdgeInsets.symmetric(vertical: 22),),
                 SizedBox(
                  width: 280,
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Column(
                       children: [
                         Container(
                           constraints: const BoxConstraints(
        minWidth: 60,
        maxWidth: 60,
          ),
                          height: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color:const Color.fromRGBO(62, 61, 61, 1),),
                          alignment: Alignment.center,
                          child: const Text("1",style: TextStyle(fontFamily: 'Amigo',fontSize: 20,color: Color.fromARGB(255, 193, 193, 193)),),
                 
                         ),
                         const SizedBox(height: 8,),
                         const Text("Viewed Jobs",style: TextStyle(fontFamily: 'Amigo',fontSize: 14,color: Colors.grey),)
                       ],
                     ),
                     Column(
                       children: [
                         Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color:const Color.fromRGBO(62, 61, 61, 1),),
                          alignment: Alignment.center,
                          child: const Text("1",style: TextStyle(fontFamily: 'Amigo',fontSize: 20,color: Color.fromARGB(255, 193, 193, 193)),),
                 
                         ),
                         const SizedBox(height: 8,),
                         const Text("Applied",style: TextStyle(fontFamily: 'Amigo',fontSize: 14,color: Colors.grey),)
                       ],
                     ),
                     Column(
                       children: [
                         Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color:const Color.fromRGBO(62, 61, 61, 1),),
                          alignment: Alignment.center,
                          child: const Text("1",style: TextStyle(fontFamily: 'Amigo',fontSize: 20,color: Color.fromARGB(255, 193, 193, 193)),),
                 
                         ),
                         const SizedBox(height: 8,),
                         const Text("Rejections",style: TextStyle(fontFamily: 'Amigo',fontSize: 14,color: Colors.grey),)
                       ],
                     ),
                 
                               ],),
                 ),
                Container(width: 150,height: 1.1,color: const Color.fromARGB(255, 88, 88, 88),margin: const EdgeInsets.symmetric(vertical: 22),),
                Container(
                  width:350 ,
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(color: const Color.fromRGBO(62, 61, 61, 1), borderRadius:BorderRadius.circular(25) ),
                  child: Column(
                    children: [
                       TextButton(onPressed: (){}, child:const Row(
                        children: [CircleAvatar
                        (backgroundColor:Color.fromRGBO(50, 50, 50, 1) ,
                          child: Icon(Icons.save, color: Colors.grey,),radius: 24,),
                         SizedBox(width: 8,),
                        Text("Saved Jobs",style: TextStyle(fontFamily: 'Amigo', fontSize: 18,color: Color.fromARGB(255, 192, 192, 192), fontWeight: FontWeight.w200,letterSpacing: 1.1))],)),
                       TextButton(onPressed: (){
                        Constants().launchInBrowser("mailto:test@example.org");
                       }, child:const Row(
                        children: [CircleAvatar
                        (backgroundColor:Color.fromRGBO(50, 50, 50, 1) ,
                          child: Icon(Icons.mail, color: Colors.grey,),radius: 24,),
                         SizedBox(width: 8,),
                        Text("Contact Us",style: TextStyle(fontFamily: 'Amigo', fontSize: 18,color: Color.fromARGB(255, 192, 192, 192), fontWeight: FontWeight.w200,letterSpacing: 1.1))],)),
                       TextButton(onPressed: (){
                        _authGoogle.signout();
                       }, child:const Row(
                        children: [CircleAvatar
                        (backgroundColor:Color.fromRGBO(50, 50, 50, 1) ,
                          child: Icon(Icons.logout, color: Colors.grey,),radius: 24,),
                         SizedBox(width: 8,),
                        Text("Log Out",style: TextStyle(fontFamily: 'Amigo', fontSize: 18,color: Color.fromARGB(255, 192, 192, 192), fontWeight: FontWeight.w200,letterSpacing: 1.1))],)),
                    ],
                  ),
                )
             
              ],
            ),
          ],
        ),
      ),
    );
  }
}