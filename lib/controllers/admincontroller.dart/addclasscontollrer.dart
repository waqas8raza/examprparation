import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/models/adddatamodel/addclassmodel.dart';
import 'package:uuid/uuid.dart';

class Adminclasscontroller extends GetxController{
  final Uuid uuid=const Uuid();
  final formKey = GlobalKey<FormState>();
  final TextEditingController classc=TextEditingController();


    saveclasstoFirebase()async {
   try{
    // Create a Question object based on the form input
    Classmodel classmodel = Classmodel(
    id: uuid.v4(),
      classValue: classc.text,
    );
    // ignore: void_checks
    await FirebaseFirestore.instance.collection('classes').add(classmodel.toJson()).whenComplete(() {
      return Get.snackbar('Class', 'Added Successfully');
    });
   }catch(ex){
    return Get.snackbar('Exception', 'Something went wrong!');
   }
  }
   


}