import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/res/styles/textstyle.dart';
import 'package:tryout/res/widgets/button.dart';
import 'package:tryout/res/widgets/mytextfield.dart';

import '../../../controllers/admincontroller.dart/addtitlecontroller.dart';

// ignore: must_be_immutable
class Addtitle extends StatelessWidget {
   Addtitle({super.key});
Admintitlecontroller controller=Get.put(Admintitlecontroller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            
             Text('Add TITLE',style: Textstyleclass.textstyle()),
            const SizedBox(height: 20,),
            
            Mytextfield(text: 'Add title', controllers: controller.titlec),
            const SizedBox(height: 20,),
            Mybutton(text: 'ADD TITLE',icon: Icons.add, ontap: () {
              if(controller.formKey.currentState!.validate()){
                controller.savetitletoFirebase();
              }
            },
            
            )
            
          ],),
        ),
      ),
    ),),);
  }
}