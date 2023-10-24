import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/res/styles/textstyle.dart';
import 'package:tryout/res/widgets/button.dart';
import 'package:tryout/res/widgets/mytextfield.dart';

import '../../../controllers/admincontroller.dart/addchaptercontroller.dart';

// ignore: must_be_immutable
class Addchapter extends StatelessWidget {
   Addchapter({super.key});
Adminchaptercontroller controller=Get.put(Adminchaptercontroller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            
             Text('ADD CHAPTER',style: Textstyleclass.textstyle()),
            const SizedBox(height: 20,),
            
            Mytextfield(text: 'Add Chapter', controllers: controller.chapterc),
            const SizedBox(height: 20,),
            Mybutton(text: 'ADD CHAPTER',icon: Icons.add, ontap: () {
              if(controller.formKey.currentState!.validate()){
                controller.savechaptertoFirebase();
              }
            },
            
            )
            
          ],),
        ),
      ),
    ),),);
  }
}