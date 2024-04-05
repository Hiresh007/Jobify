import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:vid_dowloader/authenticate/data.dart';
import 'package:vid_dowloader/pages/jobdesc.dart';

class JobCardHome extends StatefulWidget {
  const JobCardHome({super.key});

  @override
  State<JobCardHome> createState() => _JobCardHomeState();
}

class _JobCardHomeState extends State<JobCardHome> {
  List<dynamic> data = [];

  @override
  void initState()  {
    super.initState();
    getData();
  }

  void getData() async {
    data = await Data("1", "1", "Software Developer", "today").getData();
    setState(() {      
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context) {
                return JobDesc(data: data[index],);
              },));
            },
            child: Container(
              alignment: Alignment.center,
              width: 330,
              height: 320,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
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
                    child: data[index]["employer_logo"] == null
                        ? const CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.png'),
                            backgroundColor: Colors.black87,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(data[index]["employer_logo"]),
                            backgroundColor: Colors.black87,
                          ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        data[index]["employer_name"],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                            fontFamily: 'Amigo',
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data[index]["job_title"],
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
                            data[index]["job_employment_type"].toString()[0] +
                                data[index]["job_employment_type"]
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
                            data[index]["job_is_remote"] ? "Remote" : "Home",
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
                           (data[index]["job_apply_link"]);

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
