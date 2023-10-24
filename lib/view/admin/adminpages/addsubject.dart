import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/controllers/admincontroller.dart/addsubjectcontroller.dart';
import 'package:tryout/res/styles/textstyle.dart';
import 'package:tryout/res/widgets/button.dart';
import 'package:tryout/res/widgets/mytextfield.dart';

// ignore: must_be_immutable
class Addsubject extends StatelessWidget {
   Addsubject({super.key});
Adminsubjectcontroller controller=Get.put(Adminsubjectcontroller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            
             Text('ADD SUBJECT',style: Textstyleclass.textstyle()),
            const SizedBox(height: 20,),
            
            Mytextfield(text: 'Add Subject', controllers: controller.subjectc),
            const SizedBox(height: 20,),
            Mybutton(text: 'ADD SUBJECT',icon: Icons.add, ontap: () {
              if(controller.formKey.currentState!.validate()){
                controller.savesubjecttoFirebase();
              }
            },
            
            )
            
          ],),
        ),
      ),
    ),),);
  }
}