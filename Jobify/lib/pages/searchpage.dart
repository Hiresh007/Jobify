import 'package:flutter/material.dart';

import 'package:vid_dowloader/authenticate/auth_google.dart';
import 'package:http/http.dart' as http;
import 'package:vid_dowloader/components/viewjobs.dart';
import 'dart:convert';
import 'package:vid_dowloader/constants/filterconstants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin<Search>{
    final TextEditingController _controller = TextEditingController();
    final TextEditingController _pagecontroller = TextEditingController();
    final TextEditingController _pagescontroller = TextEditingController();
    final TextEditingController _datescontroller = TextEditingController();
    final TextEditingController _typecontroller = TextEditingController();
    final TextEditingController _employmentcontroller = TextEditingController();
  final AuthGoogle _authGoogle = AuthGoogle();
    List<dynamic> data = [];
  bool show = false;
  bool result = false;
   _showPopupMenu(Offset offset) async {
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
                         _authGoogle.signout();
                      },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(62, 61, 61, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),child:const Text("Logout",style: TextStyle(fontFamily: 'Amigo', fontSize: 16,),), ),
          ),
  
        ],
        elevation: 8.0,
      );
    }
  
  void  getData(String role , String page , String pages , String time , String jobtype, String employment) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://jsearch.p.rapidapi.com/search?query=$role&page=$page&num_pages=$pages&date_posted=$time&remote_jobs_only=$jobtype&employment_types=$employment'),
          headers: {
           'X-RapidAPI-Key': 'a38b5c4019msh830ebdb926cc2a5p181ab0jsn9c1cb7bf09db',
           'X-RapidAPI-Host': 'jsearch.p.rapidapi.com'
          });

      if (response.statusCode == 200) {

        data =  jsonDecode(response.body)['data'];
        setState(() {
        });
      }
    } catch (e) {
      print(e);
    }

  }
  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: AppBar(
          
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          title: Container(
            padding: const EdgeInsets.fromLTRB(12,15,12,15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search for,',
                      style: TextStyle(
                          fontFamily: 'Amigo',
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                          color: Color.fromRGBO(240, 221, 9, 1)),
                    ),
                    // ignore: prefer_const_constructors
                    Text("Jobs!",
                        style: TextStyle(
                            fontFamily: 'Amigo',
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.5)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Wish you a good day',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 2,
                            fontFamily: 'Amigo',
                            color: Color.fromARGB(255, 181, 181, 181)))
                  ],
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(_authGoogle.user.photoURL!),
                        width: 65,
                        height: 65,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
                      child:GestureDetector(
                          onTapDown: (TapDownDetails details) {
                            _showPopupMenu(details.globalPosition);
                          },
                          child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                        ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
         decoration: BoxDecoration(image: DecorationImage(image:AssetImage(result?"":"assets/search.png"),scale: 9)),
          padding: const EdgeInsets.fromLTRB(24,22,0,0),
          width: double.infinity,
          child:Column(
            
            children: [
                Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        cursorColor: Colors.white60,
                        controller: _controller,
      
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                  
                          hintText: 'Search for job title',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: 15),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(62, 61, 61, 1))),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(62, 61, 61, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(62, 61, 61, 1))),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // getData(_controller.text);
                        setState(() {
                        show = !show;
                          
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor:
                              const Color.fromARGB(255, 30, 30, 30) ),
                      child: const Icon(
                        Icons.shape_line_rounded,
                        color: Color.fromRGBO(254, 208, 73, 1.000),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        getData(_controller.text,_pagecontroller.text,_pagescontroller.text,_datescontroller.text,_typecontroller.text,_employmentcontroller.text);
                        result = true;
                        setState(() {
                          
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor:
                              const Color.fromRGBO(254, 208, 73, 1.000)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
                SizedBox(height: 10,),
                show ?SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    
                    GestureDetector(
                        onTapDown: (TapDownDetails details) {
                           Constants().showPopupPageMenu(details.globalPosition, context,_pagecontroller);
                        },
                      child:Container(
                        width: 120,
                        height: 50,
            
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 61, 61, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                        children: [
                          Text("page",style: TextStyle(fontFamily: "Amigo",fontSize: 18,color: Color.fromARGB(255, 174, 174, 174)),),
                          Icon(Icons.arrow_drop_down_outlined,color: Color.fromARGB(255, 174, 174, 174),size:25,)
                        ],
                        
                      ),),
                    ),
                    const SizedBox(width: 10,), 
                    GestureDetector(
                       onTapDown: (TapDownDetails details) {
                           Constants().showPopupPagesMenu(details.globalPosition, context,_pagescontroller);
                        },
                      child:Container(
                        width: 120,
                        height: 50,
            
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 61, 61, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                        children: [
                          Text("pages",style: TextStyle(fontFamily: "Amigo",fontSize: 18,color: Color.fromARGB(255, 174, 174, 174)),),
                          Icon(Icons.arrow_drop_down_outlined,color: Color.fromARGB(255, 174, 174, 174),size:25,)
                        ],
                        
                      ),),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                       onTapDown: (TapDownDetails details,) {
                           Constants().showPopupDatesMenu(details.globalPosition, context,_datescontroller);
                        },
                      child:Container(
                        width: 120,
                        height: 50,
            
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 61, 61, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                        children: [
                          Text("date",style: TextStyle(fontFamily: "Amigo",fontSize: 18,color: Color.fromARGB(255, 174, 174, 174)),),
                          Icon(Icons.arrow_drop_down_outlined,color: Color.fromARGB(255, 174, 174, 174),size:25,)
                        ],
                        
                      ),),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                         onTapDown: (TapDownDetails details) {
                          Constants().showPopupJobTypeMenu(details.globalPosition, context,_typecontroller);
                        },
                      child:Container(
                        width: 140,
                        height: 50,
            
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 61, 61, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                        children: [
                          Text("job_type",style: TextStyle(fontFamily: "Amigo",fontSize: 18,color: Color.fromARGB(255, 174, 174, 174)),),
                          Icon(Icons.arrow_drop_down_outlined,color: Color.fromARGB(255, 174, 174, 174),size:25,)
                        ],
                        
                      ),),
                    ),
                     const SizedBox(width: 10,),
                    GestureDetector(
                       onTapDown: (TapDownDetails details) {
                           Constants().showPopupEmploymentTypeMenu(details.globalPosition, context,_employmentcontroller);
                        },
                      child:Container(
                        width: 190,
                        height: 50,
            
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 61, 61, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                        children: [
                          Text("employment type",style: TextStyle(fontFamily: "Amigo",fontSize: 18,color: Color.fromARGB(255, 174, 174, 174)),),
                          Icon(Icons.arrow_drop_down_outlined,color: Color.fromARGB(255, 174, 174, 174),size:25,)
                        ],
                        
                      ),),
                    ),
                
                  ],)):Container(),    
           
                   ViewJobs(show: show, data: data,home:false,),
          
          ],),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}