// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/models/adddatamodel/adddatamodel.dart';
import 'package:tryout/view/mcqsscreen.dart';

class Chapterscreen extends StatelessWidget {
 Chapterscreen({super.key,required this.title});
 String title;
 Admincontroller controller=Get.put(Admincontroller());
 
  @override
  Widget build(BuildContext context) {
List<Question> filteredList = [];
          Set<String> uniqueClassNames = Set();

          for (var question in controller.questionlist) {
            if (question.subject == title && !uniqueClassNames.contains(question.chapter)) {
              filteredList.add(question);
              uniqueClassNames.add(question.chapter!);
            } 
          }
    return Scaffold(  
      appBar: AppBar(title: Text(title),),
      body:  GridView.builder(
              itemCount: filteredList.length,
              
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 3), itemBuilder: (context, index) {
               return Padding(
                
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(
                  onTap: () {
                    Get.to(Mcqsscreen(title: filteredList[index].chapter!,sub: "$title",));
                  },
                   child: 
                   
                   Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/learner.png')),
                      color: Colors.indigo.shade200,
                      boxShadow: const [
      BoxShadow(
        color: Colors.grey, // Shadow color
        offset: Offset(0, 2), // Shadow offset (x, y)
        blurRadius: 5, // Shadow blur radius
        spreadRadius: 1, // Spread radius (optional
        )
      ],
                      borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:const  EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8,bottom: 0,left: 8,right: 8),
                            child: Text("Chapter",style:TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w),
                            child: Text(
                              filteredList[index].chapter!,style:const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),),
                 ),
               );
            },),
    );
  }
}