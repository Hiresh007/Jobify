import 'package:flutter/material.dart';
import 'package:vid_dowloader/constants/filterconstants.dart';
import 'package:vid_dowloader/pages/jobdesc.dart';
import 'package:slider_button/slider_button.dart';
class ViewJobs extends StatefulWidget {
  final List<dynamic> data;
  final bool show;
  final bool home;
  const ViewJobs({super.key, required this.data, required this.show, required this.home});
  
  @override
  State<ViewJobs> createState() => _ViewJobsState();
}

class _ViewJobsState extends State<ViewJobs> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0,20,0, widget.home?0:widget.show?1:5),
      height:widget.home?double.infinity*2:widget.show?400:460,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context) {
                return JobDesc(data: widget.data[index],);
              },));
            },
            child: Container(
              alignment: Alignment.center,
              width: 330,
              height: 320,
              padding: const EdgeInsets.all(16),
              margin:  EdgeInsets.fromLTRB(0, 5, widget.home?0:15, 5),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 61, 61, 1),
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(71, 71, 71, 1),
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.all(12),
                    child: widget.data[index]["employer_logo"] == null
                        ? const CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.png'),
                            backgroundColor: Colors.black87,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.data[index]["employer_logo"]),
                            backgroundColor: Colors.black87,
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        
                      widget.data[index]["employer_name"],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontFamily: 'Amigo',
                            fontSize: 16,
                            
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.data[index]["job_title"],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Amigo',
                              fontSize: 17,
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
                          widget.data[index]["job_employment_type"].toString()[0] +
                               widget.data[index]["job_employment_type"]
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
                            widget.data[index]["job_is_remote"] ? "Remote" : "Home",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 179, 179, 179),
                                fontFamily: 'Amigo',
                                fontSize: 15),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 55,
                    child: SliderButton(
                      action: () {
                          Constants().launchInBrowser(widget.data[index]["job_apply_link"]);

                      },
                      label: const Text(
                        'Swipe',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Amigo',
                            fontSize: 18),
                      ),
                      icon: const Center(child: Text('Browse')),
                      radius: 30,
                      width: 250,
                      shimmer: false,
                      buttonColor: const Color.fromRGBO(254, 208, 73, 1.000),
                      backgroundColor: const Color.fromRGBO(71, 71, 71, 1),
                      highlightedColor: Colors.white,
                      child: SizedBox(
                          height: 60,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  backgroundColor: const Color.fromRGBO(
                                      254, 208, 73, 1.000)),
                              child: const Text(
                                "Browse",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Amigo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 2),
                              ))),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}