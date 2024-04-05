import 'package:flutter/material.dart';
import 'package:vid_dowloader/pages/login.dart';


class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 12,),
          
          height: double.infinity,
          width: double.infinity*2,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/entry.png'), alignment: Alignment(-3,0.8),scale:4.8),
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
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Text('Hi👋', style: TextStyle(color: Colors.white,fontFamily: 'Amigo', fontSize:100, fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
                  SizedBox(height: 40,),
                  Text("Let's Find a", style: TextStyle(color: Colors.white,fontFamily: 'Amigo', fontSize: 40, fontWeight: FontWeight.w400),maxLines: 2,),
                  SizedBox(height: 10,),
                  Text('"Perfect Job"', style: TextStyle(color: Colors.white,fontFamily: 'Amigo', fontSize: 54, fontWeight: FontWeight.w900,letterSpacing: 1.5),maxLines: 2,),
                ],
              ),
              const SizedBox(height: 40,),

              SizedBox(
                width: 200,
                height: 65,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => const Login()));
                },style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),),backgroundColor: Colors.black87), child: const Text('SignIn', style: TextStyle(fontFamily: 'Amigo', fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 1.2),),)),
            
            ],
          ),
        ),
    );
  }
}