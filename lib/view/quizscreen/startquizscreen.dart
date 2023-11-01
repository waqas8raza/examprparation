
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/models/adddatamodel/adddatamodel.dart';

class StartquizMcqsscreen extends StatelessWidget {
  final String title;
  final String? sub;
  final Admincontroller controller = Get.put(Admincontroller());

  StartquizMcqsscreen({super.key, required this.title, this.sub});

  @override
  Widget build(BuildContext context) {
    List<Question> filteredList = controller.questionlist
        .where((question) =>
            question.chapter == title && question.subject == "$sub")
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter $title"),
      ),
      body: 
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              filteredList[index].mcqsq!,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Column(
                            children: filteredList[index].options!.map((option) {
                              int optionIndex = filteredList[index].options!.indexOf(option);
              
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.markOptionAsSelected(
                                        filteredList[index],
                                        optionIndex,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        
                                        Expanded(
                                        
                                            child: Card(
                                              color: controller.isOptionSelected(
                                                filteredList[index],
                                                optionIndex,
                                              )
                                                  ? Colors.blue
                                                  : Colors.transparent,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  option.optionText!,
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),
              ),
              Center(
                  child: ElevatedButton(onPressed: () {
                    Get.defaultDialog(title: 'Your Score',middleText:'You Scroed ${controller.score} out of ${filteredList.length}',confirm:ElevatedButton(onPressed: () => Get.back(), child: const Text('Back'))  );
                  }, child: const Text('Submit')),
                )
            ],
            
          ),
        
    );
  }
}

