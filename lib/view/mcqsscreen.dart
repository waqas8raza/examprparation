// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/models/adddatamodel/adddatamodel.dart';

class Mcqsscreen extends StatelessWidget {
 Mcqsscreen({super.key,required this.title, this.sub});
 String title;
 String? sub;
 Admincontroller controller=Get.put(Admincontroller());
 
  @override
  Widget build(BuildContext context) {
    List<Question> filteredList = controller.questionlist
        .where((question) => question.chapter == title&& question.subject=="$sub")
        .toList();
    return Scaffold(
      
      appBar: AppBar(title: Text("Chapter $title"),),

      
      body:  ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
            return Padding(
                
                 padding: EdgeInsets.only(top: .5.h,bottom: 0.h,right: 2.w,left: 2.w),
                 child: SingleChildScrollView(
                   child: Flexible(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(bottom: 0.5.h,right: 2.w,left: 4.w),
                           child: Text(
                             '${index+1 } ) ${ filteredList[index].mcqsq!}',style: TextStyle(fontSize: 18.px,fontWeight: FontWeight.bold),),
                         ),
                         SizedBox(
                           width: double.infinity,
                           child: Padding(
                             padding: EdgeInsets.only(top: .5.h,bottom: 0.h,right: 2.w,left: 2.w),
                             child: Row(
                               children: [
                                const CircleAvatar(child: Text('A'),),SizedBox(width: 1.w,),
                                 Expanded(
                                   child: Card(child: Padding(
                                     padding:  const EdgeInsets.all(8.0),
                                     child: Text(filteredList[index].options![0].optionText.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                                   ),),
                                 ),
                               ],
                             ),
                           )),
                         SizedBox(
                           width: double.infinity,
                           child: Padding(
                             padding: EdgeInsets.only(top: .5.h,bottom: 0.h,right: 2.w,left: 2.w),
                             child: Row(
                               children: [
                                const CircleAvatar(child: Text('B'),),SizedBox(width: 1.w,),
                                 Expanded(
                                   child: Card(child: Padding(
                                     padding:  const EdgeInsets.all(8.0),
                                     child: Text(filteredList[index].options![1].optionText.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                                   ),),
                                 ),
                               ],
                             ),
                           )),
                         SizedBox(
                           width: double.infinity,
                           child: Padding(
                             padding: EdgeInsets.only(top: .5.h,bottom: 0.h,right: 2.w,left: 2.w),
                             child: Row(
                               children: [
                                const CircleAvatar(child: Text('C'),),SizedBox(width: 1.w,),
                                 Expanded(
                                   child: Card(child: Padding(
                                     padding:  const EdgeInsets.all(8.0),
                                     child: Text(filteredList[index].options![2].optionText.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                                   ),),
                                 ),
                               ],
                             ),
                           )),
                         SizedBox(
                           width: double.infinity,
                           child: Padding(
                             padding: EdgeInsets.only(top: .5.h,bottom: 0.h,right: 2.w,left: 2.w),
                             child: Row(
                               children: [
                                const CircleAvatar(child: Text('D'),),SizedBox(width: 1.w,),
                                 Expanded(
                                   child: Card(child: Padding(
                                     padding:  const EdgeInsets.all(8.0),
                                     child: Text(filteredList[index].options![3].optionText.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                                   ),),
                                 ),
                               ],
                             ),
                           )),
                        
                        SizedBox(height: 1.h,),
                        
                         Card(
                           child: ExpansionTile(
                            shape: const BeveledRectangleBorder(),
                            title: const Text("Answer",style: TextStyle(fontWeight: FontWeight.bold),),children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(filteredList[index].answer!,style: const TextStyle(fontWeight: FontWeight.bold),),
                              )
                              
                              ],),
                         ),
                           
                       ],
                     ),
                   ),
                 ),
               );
           
        },
      ),
    );
  }
}