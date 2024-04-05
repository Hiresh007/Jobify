import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:vid_dowloader/constants/filterconstants.dart';

class JobDesc extends StatefulWidget {
  final dynamic data;
  const JobDesc({super.key, this.data});

  @override
  State<JobDesc> createState() => _JobDescState();
}

class _JobDescState extends State<JobDesc> with TickerProviderStateMixin{

  TabBar get _tabBar =>   TabBar(
    splashBorderRadius: BorderRadius.circular(25),
      labelColor:const Color.fromRGBO(240, 221, 9, 1) ,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey,
      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:const Color.fromRGBO(71, 71, 71, 1)),
    // indicatorColor: const Color.fromARGB(141, 63, 249, 69),
             tabs: const [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Description",style: TextStyle(fontFamily: 'Amigo',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 1.1),),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Qualification",style: TextStyle(fontFamily: 'Amigo',fontSize: 15,fontWeight: FontWeight.w600,),),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Duties",style: TextStyle(fontFamily: 'Amigo',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 1.1),),
                        ),
                      ),
                    ],
    );
@override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
          elevation: 0,
          title: const Text("Job Detail",style: TextStyle(color: Colors.white, fontFamily:"Amigo", fontSize: 24,fontWeight: FontWeight.w800,letterSpacing: 1.5), ),
         
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            const SizedBox(height: 6,),
             Container(
                     width: 80,
                     height: 80,
                     decoration: BoxDecoration(
                         color: const Color.fromRGBO(71, 71, 71, 1),
                         borderRadius: BorderRadius.circular(18)),
                     padding: const EdgeInsets.all(16),
                     child: widget.data["employer_logo"] == null
                         ? const CircleAvatar(
                             backgroundImage: AssetImage('assets/logo.png'),
                             backgroundColor: Colors.black87,
                           )
                         : CircleAvatar(
                             backgroundImage:
                                 NetworkImage(widget.data["employer_logo"]),
                             backgroundColor: Colors.black87,
                           ),
                   ),
                   const SizedBox(height: 20,),
                   Column(
                     children: [
                       Text(
                        widget.data["employer_name"],
                         style: const TextStyle(
                             color: Color.fromARGB(255, 177, 177, 177),
                             fontFamily: 'Amigo',
                             fontSize: 18),
                       ),
                       const SizedBox(
                         height: 6,
                       ),
                       Text(widget.data["job_title"],
                           style: const TextStyle(
                               color: Color.fromARGB(255, 255, 255, 255),
                               fontFamily: 'Amigo',
                               fontSize: 20,
                               fontWeight: FontWeight.w600,
                               letterSpacing: 1.1),
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.center)
                     ],
                   ),
                   const SizedBox(
                     height: 15,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         alignment: Alignment.center,
                         padding: const EdgeInsets.all(8),
                         height: 40,
                         width: 100,
                         decoration: BoxDecoration(
                             color: const Color.fromARGB(255, 68, 68, 68),
                             borderRadius: BorderRadius.circular(15)),
                         child: Text(
                             widget.data["job_employment_type"].toString()[0] +
                                 widget.data["job_employment_type"]
                                     .toString()
                                     .substring(1)
                                     .toLowerCase(),
                             style: const TextStyle(
                                 color: Color.fromARGB(255, 179, 179, 179),
                                 fontFamily: 'Amigo',
                                 fontSize: 15)),
                       ),
                       const SizedBox(
                         width: 8,
                       ),
                       Container(
                           alignment: Alignment.center,
                           padding: const EdgeInsets.all(8),
                           height: 40,
                           width: 100,
                           decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 68, 68, 68),
                               borderRadius: BorderRadius.circular(15)),
                           child: Text(
                             widget.data["job_is_remote"] ? "Remote" : "Home",
                             style: const TextStyle(
                                 color: Color.fromARGB(255, 179, 179, 179),
                                 fontFamily: 'Amigo',
                                 fontSize: 15),
                           )),
                     ]
                   ),
            const SizedBox(height: 25,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                         children: [
                           Container(
                              alignment: Alignment.center,
                           padding: const EdgeInsets.all(8),
                            height: 55,
                           width: 55,
                           decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 68, 68, 68),
                               borderRadius: BorderRadius.circular(50)),
                             child: const Icon(Icons.person_outline_outlined, color: Color.fromARGB(255, 175, 175, 175),size: 28,),
                           ),
                           const SizedBox(height: 8,),
                          
                           const Text(
                             "Job Title",
                             style: TextStyle(
                                 color: Color.fromARGB(243, 158, 158, 158),
                                 fontFamily: 'Amigo',
                                 fontSize: 15),
                           ),
                           const SizedBox(height: 10,),
                           SizedBox(
                            width:70,
                             child: Text(
                               widget.data["job_job_title"] ?? "No Info",
                               style: const TextStyle(
                                   color: Color.fromARGB(243, 255, 255, 255),
                                   fontFamily: 'Amigo',
                                   fontSize: 18,fontWeight: FontWeight.w800,letterSpacing: 1.2,overflow: TextOverflow.fade,),
                                maxLines: 1,),
                           )
                         ],
                       ),
                       Column(
                         children: [
                           Container(
                              alignment: Alignment.center,
                           padding: const EdgeInsets.all(8),
                            height: 55,
                           width: 55,
                           decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 68, 68, 68),
                               borderRadius: BorderRadius.circular(50)),
                             child: const Icon(Icons.wallet_travel_outlined, color: Color.fromARGB(255, 175, 175, 175),size: 28,),
                           ),
                           const SizedBox(height: 8,),
                          
                           const Text(
                             "Job Type",
                             style: TextStyle(
                                 color: Color.fromARGB(243, 158, 158, 158),
                                 fontFamily: 'Amigo',
                                 fontSize: 15),
                           ),
                           const SizedBox(height: 10,),
                           Text(
                             widget.data["job_is_remote"] ? "Remote" : "Home",
                             style: const TextStyle(
                                 color: Color.fromARGB(243, 255, 255, 255),
                                 fontFamily: 'Amigo',
                                 fontSize: 18,fontWeight: FontWeight.w800,letterSpacing: 1.2),
                           )
                         ],
                       ),
                       Column(
                         children: [
                           Container(
                              alignment: Alignment.center,
                           padding: const EdgeInsets.all(8),
                            height: 55,
                           width: 55,
                           decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 68, 68, 68),
                               borderRadius: BorderRadius.circular(50)),
                             child: const Icon(Icons.account_balance_wallet_outlined, color: Color.fromARGB(255, 175, 175, 175),size:28,),
                           ),
                           const SizedBox(height: 8,),
                          
                           const Text(
                             "Salary",
                             style: TextStyle(
                                 color: Color.fromARGB(243, 158, 158, 158),
                                 fontFamily: 'Amigo',
                                 fontSize: 15),
                           ),
                           const SizedBox(height: 10,),
      
                           Row(
                             children: [
                               Text(
                                 widget.data["job_min_salary"] == null? "No Info":"${(widget.data["job_min_salary"]).toString().substring(0,2)}k" ,
                                 style: const TextStyle(
                                     color: Color.fromARGB(243, 255, 255, 255),
                                     fontFamily: 'Amigo',
                                     fontSize: 18,fontWeight: FontWeight.w800),
                               ),
                                 widget.data["job_min_salary"] != null?
                               Text(
                                 widget.data["job_max_salary"] == null? "No Info":" - " + (widget.data["job_max_salary"]).toString().substring(0,2)+'k' ,
                                 style: const TextStyle(
                                     color: Color.fromARGB(243, 255, 255, 255),
                                     fontFamily: 'Amigo',
                                     fontSize: 18,fontWeight: FontWeight.w800,letterSpacing: 1.2),
                               ):Container(),
                             ],
                           )
                         ],
                       ),
                       Column(
                         children: [
                           Container(
                              alignment: Alignment.center,
                           padding: const EdgeInsets.all(8),
                           height: 55,
                           width: 55,
                           decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 68, 68, 68),
                               borderRadius: BorderRadius.circular(50)),
                             child: const Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 175, 175, 175),size:28,),
                           ),
                           const SizedBox(height: 8,),
                          
                           const Text(
                             "Location",
                             style: TextStyle(
                                 color: Color.fromARGB(243, 158, 158, 158),
                                 fontFamily: 'Amigo',
                                 fontSize: 15),
                           ),
                           const SizedBox(height: 10,),
                           Text(
                             widget.data["job_country"]+ (widget.data["job_state"] == null?"":"," + widget.data["job_state"])  ,
                             style: const TextStyle(
                                 color: Color.fromARGB(243, 255, 255, 255),
                                 fontFamily: 'Amigo',
                                 fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 1.2),
                           ),
                         ],
                       ),
      
                     ],
                   ),
       
                  Container(width: 320,height:1 ,color: const Color.fromRGBO(71, 71, 71, 1),margin: const EdgeInsets.symmetric(vertical: 30),),
                  
                  DefaultTabController(length: 3,
                
                   child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Container(
                              width: 360,
                              height: 65,
                              decoration: BoxDecoration(border:Border.all(width:0.8,color:const Color.fromRGBO(71, 71, 71, 1) ), borderRadius: const BorderRadius.all(Radius.circular(25))),
                              child:PreferredSize(
                              
                              preferredSize: _tabBar.preferredSize,
                              child:Material(
                                
                                color: Colors.transparent,
                              child: Theme(  
                                data: ThemeData().copyWith(), child: _tabBar,),
                              )
                            ),
      
      
                          ),
                        const SizedBox(height: 30,),
                         Container(
                          height: 300,
                          padding: const EdgeInsets.symmetric(horizontal:12),
                          width: double.infinity,
                          child:  TabBarView(
                            
                            children: <Widget>[
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                              const Text("About The oppurtunity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Amigo', fontSize: 17, letterSpacing: 1.1),),
                              const SizedBox(height: 15,),
                              Expanded(
                              
                                child: SingleChildScrollView(child: Text(widget.data["job_description"],style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w200, fontFamily: 'Amigo', fontSize: 15, letterSpacing: 1.1),))),
                                // const SizedBox(height: 15,),
                             ],),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                              const Text("Qualifications :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Amigo', fontSize: 17, letterSpacing: 1.1),),
                              const SizedBox(height: 15,),
                              Expanded(
                              
                                child: SingleChildScrollView(child: Text(widget.data["job_highlights"]["Qualifications"].toString().substring(1,widget.data["job_highlights"]["Qualifications"].toString().length-1),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w200, fontFamily: 'Amigo', fontSize: 15, letterSpacing: 1.1),))),
                                // const SizedBox(height: 15,),
                             ],),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                              const Text("Responsibilities :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontFamily: 'Amigo', fontSize: 17, letterSpacing: 1.1),),
                              const SizedBox(height: 15,),
                              Expanded(
                              
                                child: SingleChildScrollView(child: Text(widget.data["job_highlights"]["Responsibilities"].toString().substring(1,widget.data["job_highlights"]["Responsibilities"].toString().length-1),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w200, fontFamily: 'Amigo', fontSize: 15, letterSpacing: 1.1),))),
                                // const SizedBox(height: 15,),
                             ],),
                          ]))
                        ],
                      )
                      
                      ;
                   },),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    width: 340,
                    height: 80,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                    child: SliderButton(
                       
                        action: () {
                          Constants().launchInBrowser(widget.data["job_apply_link"]);
                        },
                        label: const Text(
                            "Apply Now                                              ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w600, fontSize: 17, fontFamily: 'Amigo',letterSpacing: 1.2),
                          ),
                          shimmer: false,
                          backgroundColor: const Color.fromRGBO(254, 208, 73, 1.000),
                        icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        buttonSize:62,
                        buttonColor:const Color.fromRGBO(71, 71, 71, 1) ,
                      ),
                  )
                        
           ],
          ),
        ),
      ),
    );
  }
}