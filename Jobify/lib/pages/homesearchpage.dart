import 'package:flutter/material.dart';
import 'package:vid_dowloader/authenticate/data.dart';
import 'package:vid_dowloader/components/jobcardhome.dart';
import 'package:vid_dowloader/components/searchresult.dart';
import 'package:vid_dowloader/authenticate/auth_google.dart';
import 'package:vid_dowloader/constants/filterconstants.dart';
import 'package:vid_dowloader/pages/viewallppage.dart';
class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> with 
                  AutomaticKeepAliveClientMixin<HomeSearchPage>{

  final AuthGoogle _authGoogle = AuthGoogle();
  final TextEditingController _controller = TextEditingController();
  List<dynamic> data = [] ;
  List<String>jobs = ["Data Scientist","Data Analyst"
                      ,"Blockchain Engineer"
                      ,"UX Designer"
                      ,"Cyber Security Engineer"
                      ,"Cloud Developer"
                      ,"DevOps Engineer"
                      ,"Digital Marketing Specialist"];
  bool show = false;
  void getData(String role, String page, String pages) async {
      data = await Data(page, pages,role, "today").getData();
      setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
       appBar:PreferredSize(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello,',
                      style: TextStyle(
                          fontFamily: 'Amigo',
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                          color: Color.fromRGBO(240, 221, 9, 1)),
                    ),
                    // ignore: prefer_const_constructors
                    Text("${_authGoogle.user.displayName?.split(' ')[0]}!",
                        style: const TextStyle(
                            fontFamily: 'Amigo',
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.5)),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Wish you a good day',
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
                            Constants().showPopupMenu(details.globalPosition ,context,_authGoogle);
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
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24,22,0,20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 280,
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
                          getData(_controller.text, "1","1");
                          show = true;
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
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Jobs',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Amigo',
                          letterSpacing: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: TextButton(
                          onPressed: () {
                            
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                color: Color.fromARGB(204, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Amigo',
                                letterSpacing: 1.2),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const JobCardHome(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search Results',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Amigo',
                          letterSpacing: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: TextButton(
                         onPressed: () {
                            getData(_controller.text,"4","4");
                            Navigator.push(context,MaterialPageRoute(builder:(context) {
                              return ViewAll(data:data,);
                            },));
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                color: Color.fromARGB(204, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Amigo',
                                letterSpacing: 1.2),
                          )),
                    ),
                  ],
                ),
                
                show?SearchPage(data:data,) : Container(),
                const SizedBox(height: 15,),
                const Text(
                      "Popular Search's",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Amigo',
                          letterSpacing: 1.2),
                    ),
                   const SizedBox(height: 15,), 
                  SizedBox(
                    height: 300,
                    width: 250,
                    child: ListView.builder(
                      itemCount: jobs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder:(context, index) {
                      return  Container(
                        margin: const EdgeInsets.fromLTRB(0,5,0,6),
                        
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                            _controller.text= jobs[index];
                            setState(() {
                            });
                        },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(62, 61, 61, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),child:Text(jobs[index],style: const TextStyle(fontFamily: 'Amigo', fontSize: 16,),), ),
                      );
                    }, ),
                  )  
              ],
            ),
          ),
        ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}