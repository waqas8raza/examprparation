// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/view/classesscreen.dart';
import 'package:tryout/view/quizscreen/quizclasscrenn.dart';

// ignore: must_be_immutable
class Quizscreen extends StatelessWidget {
  Quizscreen({Key? key});

  List images = ['assets/carousel.png', 'assets/learner.png'];

 final Admincontroller controller = Get.put(Admincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 1.h, bottom: 1.h, right: 2.w, left: 2.w),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ),
            ),
           
            const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'All Quizes',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
            Expanded(
              child:
              
              FutureBuilder(future: controller.fetchtitleFromFirebase(), builder: (context, snapshot) {
                if(snapshot.hasData){
return  GridView.builder(
                  itemCount: controller.titlelist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 4),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(QuizClassesscreen(
                                title: controller.titlelist[index].title));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage('assets/learner.png'),
                                      fit: BoxFit.contain),
                                  color: Colors.indigo.shade200,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey, // Shadow color
                                      offset:
                                          Offset(0, 2), // Shadow offset (x, y)
                                      blurRadius: 5, // Shadow blur radius
                                      spreadRadius:
                                          1, // Spread radius (optional
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  
                                  controller.titlelist[index].title,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ),
                          ));
                    
                  },
                );
             
                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
              },)
             
              ),
          
          ],
        ),
      ),
    );
  }
}
