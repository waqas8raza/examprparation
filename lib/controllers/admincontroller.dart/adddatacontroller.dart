import 'package:cloud_firestore/cloud_firestore.dart';
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
@override
  void onInit() {
   fetchtitleFromFirebase();
    fetchclassFromFirebase();
    fetchchapterFromFirebase();
    fetchsubjectFromFirebase();
    fetchquestionFromFirebase();
    super.onInit();
  }

  
Future<List<Titlemodel>> fetchtitleFromFirebase() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('titles').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Titlemodel titlemodel = Titlemodel.fromJson(data);
      titlelist.value.add(titlemodel);
    }
    print(titlelist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return titlelist.value; 
}
Future<List<Classmodel>> fetchclassFromFirebase() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('classes').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Classmodel classmodel = Classmodel.fromJson(data);
      classeslist.value.add(classmodel);
    }
    print(classeslist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return classeslist.value; 
}
Future<List<Chaptermodel>> fetchchapterFromFirebase() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('chapters').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Chaptermodel chaptermodel = Chaptermodel.fromJson(data);
      chapterlist.value.add(chaptermodel);
    }
    print(chapterlist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return chapterlist.value; 
}
Future<List<Subjectmodel>> fetchsubjectFromFirebase() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('subjects').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Subjectmodel subjectmodel = Subjectmodel.fromJson(data);
      subjectlist.value.add(subjectmodel);
    }
    print(chapterlist.length);
  } catch (e) {
    print('Error fetching data from Firebase: $e');
  }

  return subjectlist.value; 
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
          itemCount: titlelist.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(titlelist[index].title.toString()),
              onTap: () {
                Get.back();
                titlec.value.text = titlelist.value[index].title.toString();
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
          itemCount: chapterlist.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(chapterlist[index].chapter),
              onTap: () {
                Get.back();
                chapterc.value.text = chapterlist.value[index].chapter;
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
          itemCount: classeslist.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(classeslist.value[index].classValue),
              onTap: () {
                classc.value.text = classeslist.value[index].classValue;
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
            itemCount: subjectlist.value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(subjectlist.value[index].subject),
                onTap: () {
                  subjectc.value.text = subjectlist.value[index].subject;
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