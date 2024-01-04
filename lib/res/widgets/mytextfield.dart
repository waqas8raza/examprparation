import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/admincontroller.dart/adddatacontroller.dart';

// ignore: must_be_immutable
class Mytextfield extends StatefulWidget {
  final String text;
  final dynamic controllers;
  IconButton? iconbutton;
  bool? readonly;
  VoidCallback? onTap;

   Mytextfield({super.key, 
    required this.text,
    required this.controllers,
    this.iconbutton,
    this.readonly,
    this.onTap
  });

  @override
  State<Mytextfield> createState() => _MytextfieldState();
}

class _MytextfieldState extends State<Mytextfield> {
 final Admincontroller controller=Get.put(Admincontroller());

  @override
  // ignore: override_on_non_overriding_member
  int selectedvalue=-1;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: Column(
        children: [
          if (widget.controllers is TextEditingController)
            TextFormField(
              onTap:widget.onTap ,
              controller: widget.controllers,
              decoration: InputDecoration(
                suffixIcon: widget.iconbutton,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: widget.text,
                hintText: 'Enter ${widget.text}',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter ${widget.text}';
                }
                return null;
              },
            ),
          if (widget.controllers is List<TextEditingController>)
            Column(
              children: [
                for (var i = 0; i < widget.controllers.length; i++)
                   Padding(
                     padding: const EdgeInsets.only(top: 3,bottom: 3),
                     child: TextFormField(
                        
                        controller: widget.controllers[i],
                        decoration: InputDecoration(
                          suffixIcon:  Radio(
                        value: i,
                        groupValue: selectedvalue,
                        onChanged: (value) {
                          setState(() {
                             selectedvalue=value as int;
                          controller.setTrueIndex(selectedvalue);
                          });
                         
                        },
                      ),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: i == 0 ? widget.text : '', // Display label for the first option only
                          hintText: 'Enter ${widget.text} ${i + 1}',
                           fillColor: i == selectedvalue? Colors.green : null,
                                     
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter ${widget.text} ${i + 1}';
                          }
                          return null;
                        },
                      ),
                   ),
                
              ],
            ),
        ],
      ),
    );
  }
}
