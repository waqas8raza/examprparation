import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/models/adddatamodel/addsubjectmodel.dart';
import 'package:uuid/uuid.dart';

class Adminsubjectcontroller extends GetxController{
  final Uuid uuid=const Uuid();
  final formKey = GlobalKey<FormState>();
  final TextEditingController subjectc=TextEditingController();


    savesubjecttoFirebase()async {
   try{
    // Create a Question object based on the form input
    Subjectmodel subjectmodel = Subjectmodel(
    id: uuid.v4(),
      subject: subjectc.text,
    );
    // ignore: void_checks
    await FirebaseFirestore.instance.collection('subjects').add(subjectmodel.toJson()).whenComplete(() {
      return Get.snackbar('Subject', 'Added Successfully');
    });
   }catch(ex){
    return Get.snackbar('Exception', 'Something went wrong!');
   }
  }
   


}