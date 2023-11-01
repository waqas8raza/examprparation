import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tryout/Homeclass.dart';
import 'package:tryout/controllers/bottombarcontroller/bottombarcontroller.dart';
import 'package:tryout/view/quizscreen/quizscreen.dart';


class Bottomnavigationbar extends StatefulWidget {
  static const title = 'salomon_bottom_bar';

  const Bottomnavigationbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomnavigationbarState createState() => _BottomnavigationbarState();
}
BottomNavigationBarController controller=Get.put(BottomNavigationBarController());
class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar:GetX<BottomNavigationBarController>(
                builder: (controller) => 
                   SalomonBottomBar(
                  currentIndex:controller.currentIndex.value,
            onTap: (index) {
              controller.changeScreen(index); // Update the selected index
            },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.quiz),
              title: const Text("Quiz"),
              selectedColor: Colors.pink,
            ),

            /// Search
           

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.contact_support),
              title: const Text("Contact Us"),
              selectedColor: Colors.teal,
            ),
          ],
          
        )
         
        
     ),body: Obx(() {
        // Create a widget or switch statement to display the selected screen content
        Widget selectedScreen=Homescreen();
        switch (controller.currentIndex.value) {
          case 0:
            selectedScreen = Homescreen();
            break;
          case 1:
            selectedScreen = Quizscreen();
            break;
          case 2:
            selectedScreen = Homescreen();
            break;
          
        }

        return selectedScreen;
      }), );
     
  }
}