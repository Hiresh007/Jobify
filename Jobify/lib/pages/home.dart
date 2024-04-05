import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:vid_dowloader/constants/filterconstants.dart';
import 'package:vid_dowloader/pages/homesearchpage.dart';
import 'package:vid_dowloader/pages/profile.dart';
import 'package:vid_dowloader/pages/searchpage.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool show = false;
  late final TabController _tabcontroller;
   @override
     void initState(){
     super.initState();
     _tabcontroller = TabController(length: 3, vsync:this) ; 
   }
  @override

  
  Widget build(BuildContext context) {  
      
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1), 
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body:TabBarView(
        controller:_tabcontroller ,
        children:const <Widget> [
            HomeSearchPage(),
            Search(),
            Profile()
      ]),
      bottomNavigationBar: Container(
                            width: 200,
                              height: 62,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55)), color: Color.fromARGB(255, 30, 30, 30)),
        margin: const EdgeInsets.symmetric(horizontal: 15),

        child:TabBar(
          controller: _tabcontroller,
      splashBorderRadius: const BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55)),
      labelColor:const Color.fromRGBO(240, 221, 9, 1) ,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey,
      indicator: const BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(55),
                        topRight: Radius.circular(55)
                        ),
                        color:Color.fromRGBO(71, 71, 71, 1)),
             tabs: const [
                      Tab(   
                        child: Align(
                          
                          alignment: Alignment.center,
                          child:Icon(Icons.home_filled),
                        ),
                        
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child:Icon(Icons.search) ,
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.person_outline_outlined,),
                        ),
                      ),
                    ],
    ),
      ),
      floatingActionButton: DraggableFab(
      
        child: SizedBox(
        width: 65,
        height: 65,
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 1,color: const Color.fromARGB(255, 134, 134, 134)),borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.all(2),
          child: FloatingActionButton(
          
            onPressed: (){
              Constants().showaimenu(context);
              setState(() {
                
              });
            },backgroundColor:const Color.fromRGBO(45, 45, 45, 1),child: const Image(image: AssetImage("assets/search.png",),width: 50,height: 50,),))),
      ),
    );
  }
}
