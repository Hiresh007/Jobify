import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;
import 'package:vid_dowloader/constants/filterconstants.dart';
import '../components/glass.dart';
class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> with AutomaticKeepAliveClientMixin<AiChat> {
    final TextEditingController messageController = TextEditingController();
    final List<AiMessage> _messages  = [];
    final SpeechToText _speech = SpeechToText();
    bool isListening = false;
 
    void onSend(){
      AiMessage message= AiMessage(true, messageController.text);
      setState(() {
        _messages.insert(0, message);
      });
     sendMessage(message.text);
     messageController.clear();
    }

    void sendMessage(String? message) async{
     final Map<String , dynamic>map = {
      "messages":[{
          'role' : 'user',
          'content':message,
       }],
      'web_access': false
     };
     final response = await  http.post(
        Uri.parse("https://open-ai21.p.rapidapi.com/conversationllama"),
        headers: {
           'Content-Type': 'application/json',
           'X-RapidAPI-Key': 'a38b5c4019msh830ebdb926cc2a5p181ab0jsn9c1cb7bf09db',
           'X-RapidAPI-Host': 'open-ai21.p.rapidapi.com'
      },
        body: json.encode(map)
       );

       Map<String , dynamic> res = jsonDecode(response.body);
      AiMessage data = AiMessage(false,res['LLAMA'].toString());
        _messages.insert(0, data);
        setState(() {
      });

      print(data);
    }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      // backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(0, 0, 0, 1),
        elevation: 0,
        title: const Text('Ai Chat', style: TextStyle(fontSize: 32, fontFamily: "Amigo",fontWeight: FontWeight.w600,letterSpacing: 1.2),),
        centerTitle: true,
      ),
      body: Container(   
            padding: const EdgeInsets.fromLTRB(0, 15,0,0),    
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
          child: Column(
            children: [
          
            // for chats
           Expanded(
            flex: 1,
            child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context , int index) {
             return  _messages[index].isMe?  Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 FittedBox(
                  fit: BoxFit.fitHeight,
                   child: Container(
                     constraints:BoxConstraints(maxWidth: 300),
                     margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                     padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                     decoration: const BoxDecoration(
                     borderRadius:BorderRadius.only(bottomLeft: Radius.circular(15) , bottomRight: Radius.circular(15), topLeft: Radius.circular(15)) ,
                      color: Color.fromARGB(200, 125, 226, 107)
                     ),
                     child: Text(
                          _messages[index].text.toString(),
                          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Amigo', fontSize: 20),
                          softWrap: true,
                          maxLines: 100,
                     ),
                   ),
                 ),
               ],
             ) :
                          Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                               
                               children: [
                                 FittedBox(
                                    fit: BoxFit.fitHeight,
                                   child: Container(
                                     constraints:BoxConstraints(maxWidth: 300),  
                                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                                     decoration: const BoxDecoration(
                                      borderRadius:BorderRadius.only(bottomLeft: Radius.circular(15) , bottomRight: Radius.circular(15), topRight: Radius.circular(15)) ,
                                      
                                      color: Color.fromARGB(175, 23, 51, 18)
                                     ),
                                     child: Text(
                                       _messages[index].text.toString(),
                                       style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Amigo', fontSize: 20),
                                       
                                      //  maxLines: 100,
                                                                     
                                     ),
                                   ),
                                 ),
                                 IconButton(onPressed: () {
                                  Clipboard.setData(ClipboardData(text:   _messages[index].text.toString()));
                                 }, icon: const Icon(Icons.copy, color: Colors.white,))
                               ],
                             );
           })),
             
             SizedBox(
              height: 80,
               child: Glass(    
                Container(
                 alignment: Alignment.center, 
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: 
                      TextFormField(autocorrect:true,
                      maxLines: null,
                      controller: messageController ,
                      decoration:const InputDecoration(border: InputBorder.none, hintText: "Send a message", hintStyle: TextStyle(color: Colors.white)) ,style: const TextStyle(color: Colors.white, fontSize: 18),)
                    ),
                    IconButton(onPressed: () {
                       _listen();
                    }, icon: Icon(isListening ?Icons.mic:Icons.mic_none),),
                    IconButton(onPressed: () {
                        onSend();
                    }, icon:const Icon(Icons.send))
                  ],
                ),
               )
               ),
             )
          ],),
          ),
        );
  }

    void _listen() async{
    if(!isListening){
      bool available = await _speech.initialize(
           onStatus: (val) => print('onStatus: $val'),
           onError: (val) => print('onError:$val')
      );
      if(available){
        setState(() {
          isListening = true;
        });
        _speech.listen(
            onResult: (val) => setState(() {
              messageController.text = val.recognizedWords;
          
            })
        );
      }
    }
      else{
        setState(() {
          isListening = false;
          _speech.stop();
        });
      }
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}