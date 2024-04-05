import 'package:flutter/material.dart';
import 'package:vid_dowloader/components/viewjobs.dart';

class ViewAll extends StatefulWidget {
  final List<dynamic> data;
  const ViewAll({super.key, required this.data});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            toolbarHeight: 70,
            backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
            elevation: 0,
            title: const Text("All Jobs",style: TextStyle(color: Colors.white, fontFamily:"Amigo", fontSize: 26,fontWeight: FontWeight.w800,letterSpacing: 1.5), ),
            automaticallyImplyLeading: true,
          ),
        ),

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: widget.data.isNotEmpty?ViewJobs(show: false, data:widget.data,home: true,):Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/search.png"),scale: 9)),)),
    );
  }
}