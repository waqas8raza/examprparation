import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/models/adddatamodel/adddatamodel.dart';
import 'package:tryout/view/quizscreen/quizsubjectscreen.dart';
import 'package:tryout/view/subjectscreen.dart';

// ignore: must_be_immutable
class QuizClassesscreen extends StatefulWidget {
 QuizClassesscreen({super.key,required this.title});
 String title;

  @override
  State<QuizClassesscreen> createState() => _QuizClassesscreenState();
}

class _QuizClassesscreenState extends State<QuizClassesscreen> {
 Admincontroller controller=Get.put(Admincontroller());
  RxList<Question>filteredList=<Question>[].obs;

  Widget build(BuildContext context) {
    // List<Question>filteredList=controller.questionlist
    //     .where((question) => question.title == widget.title)
    //     .toList();
    return Scaffold(
      
      appBar: AppBar(title: Text(widget.title),),

      
      body:FutureBuilder(future: controller.fetchclassFromFirebase(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
            List<Question> filteredList = [];
          Set<String> uniqueClassNames = Set();

          for (var question in controller.questionlist) {
            if (question.title == widget.title && !uniqueClassNames.contains(question.classname)) {
              filteredList.add(question);
              uniqueClassNames.add(question.classname!);
            }
        //  filteredList.value=controller.questionlist.where((element) => element.title==widget.title).toList();
          }
        
        
        return  GridView.builder(
                              itemCount:filteredList.length,
                              
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 3), itemBuilder: (context, index) {
                               return Padding(
                                
                                 padding: const EdgeInsets.all(8.0),
                                 child: InkWell(
                                   onTap: () {
                                    Get.to(QuizSubjectscreen(title:filteredList[index].classname!));
                                  },
                                   child:    Container(
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(image: AssetImage('assets/learner.png')),
                                      color: Colors.indigo.shade200,
                                      boxShadow:  const [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                  offset: Offset(0, 2), // Shadow offset (x, )y)
            blurRadius: 5, // Shadow blur radius
            spreadRadius: 1, // Spread radius (optio)nal
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
                          child: Text("Class",style:TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: Text(
                          filteredList[index].classname!,style:const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),),
               ),
             );
          },);}
          return const Center(child: CircularProgressIndicator());
      },)
    );
  }
}