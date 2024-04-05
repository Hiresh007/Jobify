import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vid_dowloader/authenticate/auth_google.dart';
import 'package:vid_dowloader/components/aichat.dart';


class Constants{
   int count = 0;
   showaimenu(BuildContext context) async{
    
    await showMenu(
        context: context,
          
        position:const RelativeRect.fromLTRB(180,380,60, 0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20),topLeft: Radius.circular(20))),
        color:const Color.fromARGB(196, 62, 61, 61) ,
        items: [
         PopupMenuItem(

            value: 1,
            child:Column(children:[

                 Image.asset('assets/bot.png',scale: 8,),
              SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context) {
                       return const AiChat();
                      },));

                                      },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(62, 61, 61, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),child:const Text("Lets Talk",style: TextStyle(fontFamily: 'Amigo', fontSize: 16,),), ),
              )
            ]
            ),
          ),
  
        ],
        elevation: 8.0,
      );
   }
 showPopupMenu(Offset offset ,BuildContext context,AuthGoogle authGoogle) async {
       double left = offset.dx;
      await showMenu(
        context: context,
        
        position:RelativeRect.fromLTRB(left,140, 40, 0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        items: [
         PopupMenuItem(
            value: 1,
            child:ElevatedButton(onPressed: (){
                         authGoogle.signout();
                      },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(62, 61, 61, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),child:const Text("Logout",style: TextStyle(fontFamily: 'Amigo', fontSize: 16,),), ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
  
   showPopupPageMenu(Offset offset, BuildContext context,TextEditingController controller) async {
      //  double left = offset.dx;
      //  double top = offset.dy;
      await showMenu(
        context: context,
        position:const RelativeRect.fromLTRB(25,360,100,10),
        shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        
        items: [
         PopupMenuItem(
            padding: const EdgeInsets.all(0),
            value: 1,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:80,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                          cursorColor: Colors.white60,
                          controller: controller,
                          // initialValue: count.toString(),
                          style: const TextStyle(color: Colors.white,fontFamily: 'Amigo', fontSize:18),
                          decoration: const InputDecoration(
                            
                            hintText: 'Page...',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 12),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(62, 61, 61, 1))),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color.fromRGBO(87, 87, 87, 1),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(62, 61, 61, 1))),
                          )),

                          
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: 60,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    count++;
                    controller.text = count.toString();
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(254, 208, 73, 1.000), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Icon(Icons.add,color: Colors.black,),),
                )
              ],
            ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
   showPopupPagesMenu(Offset offset, BuildContext context,TextEditingController controller) async {
      //  double left = offset.dx;
      //  double top = offset.dy;
      await showMenu(
        context: context,
        position:const RelativeRect.fromLTRB(230,360,70,10),
        shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        
        items: [
         PopupMenuItem(
            padding: const EdgeInsets.all(0),
            value: 1,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:80,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                          cursorColor: Colors.white60,
                          controller: controller,
                          // initialValue: count.toString(),
                          style: const TextStyle(color: Colors.white,fontFamily: 'Amigo', fontSize:18),
                          decoration: const InputDecoration(
                    
                            hintText: 'Page...',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 12),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(62, 61, 61, 1))),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color.fromRGBO(87, 87, 87, 1),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(62, 61, 61, 1))),
                          )),

                          
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: 60,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    count++;
                    controller.text = count.toString();
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(254, 208, 73, 1.000), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Icon(Icons.add,color: Colors.black,),),
                )
              ],
            ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
   showPopupDatesMenu(Offset offset, BuildContext context,TextEditingController controller) async {
        final left = offset.dx;
        
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(left,360,100,10),
        shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        
        items: [
         PopupMenuItem(
            
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
            value: 1,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "today";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("today",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "3days";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("3days",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "week";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("week",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "month";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("month",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),
              ],
            ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
   showPopupJobTypeMenu(Offset offset, BuildContext context,TextEditingController controller) async {
        final left = offset.dx;
        
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(left,360,100,10),
        shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        
        items: [
         PopupMenuItem(  
            value: 1,
            child:SizedBox(
              width: 130,
              height: 45,
              child: ElevatedButton(onPressed: (){
                controller.text = "true";
              },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("remote",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
            ),
          ),
         PopupMenuItem(
            value: 2,
            child: SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "false";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("home",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
   showPopupEmploymentTypeMenu( Offset offset, BuildContext context,TextEditingController controller) async { 
        final left = offset.dx;
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(left,360,100,10),
        shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
        color:const Color.fromARGB(220, 62, 61, 61) ,
        items: [
         PopupMenuItem(
            value: 1,
            child:SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "FULLTIME";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("fulltime",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                )
          ),
          PopupMenuItem(
            value: 2,
            child: SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "PARTTIME";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("parttime",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),),
          PopupMenuItem(
            value: 3,
            child:  SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "CONTRACTOR";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("contractor",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),),
                PopupMenuItem(
                  value: 4,
                  child: SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(onPressed: (){
                    controller.text = "INTERN";
                  },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(87, 87, 87, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child:const Text("internship",style: TextStyle(fontFamily: 'Amigo',color: Colors.white, fontSize: 18),),),
                ),)
  
        ],
        elevation: 8.0,
      );
    }

  Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class AiMessage{
  String? text;
  bool isMe = true ;
  AiMessage(this.isMe , this.text); 
}