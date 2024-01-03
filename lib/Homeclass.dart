import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/controllers/admincontroller.dart/adddatacontroller.dart';
import 'package:tryout/view/classesscreen.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  Homescreen({Key? key});

  List images = ['assets/carousel.png', 'assets/learner.png'];

  final Admincontroller controller = Get.put(Admincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 1.h, bottom: 1.h, right: 2.w, left: 2.w),
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onTap: () {
                        controller.issearching.value == true;
                        
                          controller.searchText.value=''; 
                        
                      },
                      onChanged: (value) {
                        controller.filterSearchResults(value);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Hi",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              "Learner!",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    // Image(image: AssetImage('assets/splash.png')),
                    Container(
                      height: 16.h,
                      width: 40.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage('assets/learner.png'),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  scrollDirection: Axis.vertical,
                  autoPlayCurve: Curves.easeInCubic,
                ),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'All Courses',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
               FutureBuilder(
                            future: controller.fetchtitleFromFirebase(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Obx(() => GridView.builder(
                                                                  shrinkWrap: true,
                                                                  itemCount: controller.searchText.value.isEmpty
                                                                      ? controller.titlelist.length
                                                                      : controller.filteredList.length,
                                                                  gridDelegate:
                                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                                          crossAxisCount: 1, childAspectRatio: 4),
                                                                  itemBuilder: (context, index) {
                                                                    return Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: InkWell(
                                                                          onTap: () {
                                                                            Get.to(Classesscreen(
                                                                                title: controller.searchText.value.isEmpty
                                                                                    ? controller.titlelist[index].title
                                                                                    : controller.filteredList[index].title,));
                                                                          },
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                                image: const DecorationImage(
                                                                                    image: AssetImage('assets/learner.png'),
                                                                                    fit: BoxFit.contain),
                                                                                color: Colors.indigo.shade200,
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Colors.grey, // Shadow color
                                                                                    offset: Offset(
                                                                                        0, 2), // Shadow offset (x, y)
                                                                                    blurRadius: 5, // Shadow blur radius
                                                                                    spreadRadius:
                                                                                        1, // Spread radius (optional
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(10)),
                                                                            child: Center(
                                                                                child: Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Text(
                                                                                controller.searchText.value.isEmpty
                                                                                    ? controller.titlelist[index].title
                                                                                    : controller.filteredList[index].title,
                                                                                style: const TextStyle(
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    fontSize: 30,
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.bold),
                                                                              ),
                                                                            )),
                                                                          ),
                                                                        ));
                                                                  },
                                                                ));
                                                              } else {
                                                                return const Center(child: CircularProgressIndicator());
                                                              }
                                                            },
                                                              ),
               
                          ],
                        )),
        ),
      );
  }
}
