import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/res/styles/textstyle.dart';
import 'package:tryout/res/widgets/button.dart';
import 'package:tryout/res/widgets/mytextfield.dart';

class Adddata extends StatelessWidget {
   Adddata({super.key});

Admincontroller controller=Get.put(Admincontroller());

  @override
  Widget build(BuildContext context) {
    controller.fetchtitleFromFirebase();
    return  Scaffold(body:  SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            
             Text('ADD MCQS',style: Textstyleclass.textstyle()),
            const SizedBox(height: 20,),
            Obx(
()=>       Mytextfield(text: 'Select Title', controllers: controller.titlec.value,readonly: true,onTap:() =>controller.showtitleDropdown(context) ,iconbutton: IconButton(onPressed: () =>controller.showtitleDropdown(context)
                
              , icon: const Icon(Icons.arrow_drop_down)),),
            ),
            const SizedBox(height: 20,),
            Obx(
              ()=> Mytextfield(text: 'Select Class', controllers: controller.classc.value,readonly: true,onTap:() =>controller.showclassDropdown(context) ,iconbutton: IconButton(onPressed: () =>controller.showclassDropdown(context)
                
              , icon: const Icon(Icons.arrow_drop_down)),),
            ),
            const SizedBox(height: 20,),
            Obx(
              ()=> Mytextfield(text: 'Select Subject', controllers: controller.subjectc.value,readonly: true,onTap:() =>controller.showsubjectDropdown(context) ,iconbutton: IconButton(onPressed: () =>controller.showclassDropdown(context)
                
              , icon: const Icon(Icons.arrow_drop_down)),),
            ),
            const SizedBox(height: 20,),
            Obx(
              ()=> Mytextfield(text: 'Select Chapter', controllers: controller.chapterc.value,readonly: true,onTap:() =>controller.showchapterDropdown(context) ,iconbutton: IconButton(onPressed: () =>controller.showchapterDropdown(context)
                
              , icon: const Icon(Icons.arrow_drop_down)),),
            ),
            const SizedBox(height: 20,),
            
            Mytextfield(text: 'MCQS Question', controllers: controller.questionc),
            const SizedBox(height: 20,),
            Mytextfield(text: 'Options', controllers: controller.optionc,),
            const SizedBox(height: 20,),
            Mytextfield(text: 'Answer', controllers: controller.answerc),
            const SizedBox(height: 20,),
            Mybutton(text: 'ADD MCQS',icon: Icons.add, ontap: () {
              if(controller.formKey.currentState!.validate()){
                controller.saveToFirebase();
              }
            },
            
            )
            
          ],),
        ),
      ),
    ),),);
  }
}