// ignore_for_file: void_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/models/adddatamodel/addchaptermodel.dart';
import 'package:tryout/models/adddatamodel/addclassmodel.dart';
import 'package:tryout/models/adddatamodel/addsubjectmodel.dart';
import 'package:uuid/uuid.dart';
import '../../models/adddatamodel/adddatamodel.dart';
import '../../models/adddatamodel/addtitlemodel.dart';

class Admincontroller extends GetxController{
  final Uuid uuid=const Uuid();
  final formKey = GlobalKey<FormState>();
  
  final Rx<TextEditingController> titlec=Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> classc=Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> subjectc=Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> chapterc=Rx<TextEditingController>(TextEditingController());
  final TextEditingController questionc=TextEditingController(); 
    final List<TextEditingController> optionc = List.generate(4, (_) => TextEditingController());
  final TextEditingController answerc=TextEditingController();
  var selectedValue = 'Option 1'.obs;
  var trueindex = RxInt(-1); 
     final RxList<Titlemodel> titlelist=<Titlemodel>[].obs;
     final RxList<Classmodel> classeslist=<Classmodel>[].obs;
     final RxList<Chaptermodel> chapterlist=<Chaptermodel>[].obs;
     final RxList<Subjectmodel> subjectlist=<Subjectmodel>[].obs;
     final List<Question> questionlist=[];
   final  RxBool iscorrect=true.obs;
     RxBool isselected=false.obs;
     RxBool issearching=false.obs;
     var score=0.obs;
@override
  void onInit() {
    fetchclassFromFirebase();
    fetchchapterFromFirebase();
    fetchsubjectFromFirebase();
    fetchquestionFromFirebase();
    super.onInit();
  }
//searching
 RxList<Titlemodel> filteredList = <Titlemodel>[].obs;

 RxString searchText = ''.obs;

 
 void filterSearchResults(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredList.assignAll(titlelist);
    } else {
      filteredList.assignAll(
        titlelist.where(
          (item) => item.title.toLowerCase().contains(query.toLowerCase()),
        ).toList(),
      );
    }
  }

  var selectedOptions = <Map<String, dynamic>>[].obs;

  void markOptionAsSelected(Question question, int optionIndex) {
    var selectedQuestion = selectedOptions.firstWhere(
      (element) =>
          element['questionId'] == question.id,
      orElse: () => <String, dynamic>{
        'questionId': question.id ?? '',
        'selectedOption': -1,
      },
    );

    if (selectedQuestion['selectedOption'] != -1) {
      return;
    } if (question.options![optionIndex].isCorrect!) {
      score++;
    }

    selectedQuestion['selectedOption'] = optionIndex;
    selectedOptions.add(selectedQuestion);
  }

  bool isOptionSelected(Question question, int optionIndex) {
    var selectedQuestion = selectedOptions.firstWhere(
      (element) =>
          element['questionId'] == question.id,
      orElse: () => <String, dynamic>{
        'questionId': question.id ?? '',
        'selectedOption': -1,
      },
    );

    return selectedQuestion['selectedOption'] == optionIndex;
  }
  
Future<List<Titlemodel>> fetchtitleFromFirebase() async {
  try {
    titlelist.clear();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('titles').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Titlemodel titlemodel = Titlemodel.fromJson(data);
      titlelist.add(titlemodel);
     
    }
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return titlelist; 
}
Future<List<Classmodel>> fetchclassFromFirebase() async {
  
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('classes').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Classmodel classmodel = Classmodel.fromJson(data);
      classeslist.add(classmodel);
    }
    print(classeslist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return classeslist; 
}
Future<List<Chaptermodel>> fetchchapterFromFirebase() async {
  chapterlist.clear();
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('chapters').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Chaptermodel chaptermodel = Chaptermodel.fromJson(data);
      chapterlist.add(chaptermodel);
    }

  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return chapterlist; 
}
Future<List<Subjectmodel>> fetchsubjectFromFirebase() async {
  subjectlist.clear();
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('subjects').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Subjectmodel subjectmodel = Subjectmodel.fromJson(data);
      subjectlist.add(subjectmodel);
    }
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return subjectlist; 
}
  void setTrueIndex(int index) {
    trueindex.value = index;
  }

  void updateSelectedValue(String newValue) {
    selectedValue.value = newValue;
  }
   showtitleDropdown(BuildContext context,) {
    Get.bottomSheet(
      Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
          itemCount: titlelist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(titlelist[index].title.toString()),
              onTap: () {
                Get.back();
                titlec.value.text = titlelist[index].title.toString();
              },
            );
          },
        ),
      ),
    );
  }
   
  showchapterDropdown(BuildContext context,) {
    Get.bottomSheet(
      Container(  
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
          itemCount: chapterlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(chapterlist[index].chapter),
              onTap: () {
                Get.back();
                chapterc.value.text = chapterlist[index].chapter;
              },
            );
          },
        ),
      ),
    );
  }
   
   showclassDropdown(BuildContext context,) {
    Get.bottomSheet(
      Container(    
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
          itemCount: classeslist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(classeslist[index].classValue),
              onTap: () {
                classc.value.text = classeslist[index].classValue;
                Get.back();
              }
            );
          },
        ),
      ),
    );
  }
   showsubjectDropdown(BuildContext context,) {
    Get.bottomSheet(
      Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),borderRadius: BorderRadius.circular(10)),
          child: ListView.builder(
            itemCount: subjectlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(subjectlist[index].subject),
                onTap: () {
                  subjectc.value.text = subjectlist[index].subject;
                  Get.back();
                }
              );
            },
          ),
        ),
      
    );
  } 
 saveToFirebase()async {
   try{
     List<Options> optionsList = [];
   for (int i = 0; i < optionc.length; i++) {
    optionsList.add(Options(optionText: optionc[i].text, isCorrect: i == trueindex.value));
    }
    // Create a Question object based on the form input
    Question question = Question(
    id: uuid.v4(),
      title: titlec.value.text,
      classname: classc.value.text,
      subject: subjectc.value.text,
      chapter: chapterc.value.text,
      mcqsq: questionc.value.text,
      options:optionsList,
      answer: answerc.text,
    );
    await FirebaseFirestore.instance.collection('Questions').add(question.toJson()).whenComplete(() {
      return Get.snackbar('MCQS', 'Added Successfully');
    });
      optionc.clear();
   }catch(ex){
    return Get.snackbar('Exception', 'Something went wrong!');
   }
  }
  Future<List<Question>> fetchquestionFromFirebase() async {
 

  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Questions').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Question question = Question.fromJson(data);
      questionlist.add(question);
    }
    print(questionlist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return questionlist;
  
}
}