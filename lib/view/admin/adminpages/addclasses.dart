import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/res/styles/textstyle.dart';
import 'package:tryout/res/widgets/button.dart';
import 'package:tryout/res/widgets/mytextfield.dart';

import '../../../controllers/admincontroller.dart/addclasscontollrer.dart';

// ignore: must_be_immutable
class Addclass extends StatelessWidget {
   Addclass({super.key});
Adminclasscontroller controller=Get.put(Adminclasscontroller());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            
             Text('ADD CLASS',style: Textstyleclass.textstyle()),
            const SizedBox(height: 20,),
            
            Mytextfield(text: 'Add Class', controllers: controller.classc),
            const SizedBox(height: 20,),
            Mybutton(text: 'ADD CLASS',icon: Icons.add, ontap: () {
              if(controller.formKey.currentState!.validate()){
                controller.saveclasstoFirebase();
              }
            },
            
            )
            
          ],),
        ),
      ),
    ),),);
  }
}