import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryout/view/admin/adminpages/addclasses.dart';
import 'package:tryout/view/admin/adminpages/adddata.dart';
import 'package:tryout/view/admin/adminpages/addsubject.dart';
import 'package:tryout/view/admin/adminpages/addtitle.dart';

import '../../view/admin/adminpages/addchapter.dart';
import '../../view/admin/dashboardpage.dart';

class DashboradController extends GetxController {
  var selectedPageIndex = 0.obs;

  void changePage(int index) {
    selectedPageIndex.value = index;
  }
  Widget getPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const DashboardPage();
      case 1:
        return Adddata();
      case 2:
        return Addtitle();
      case 3:
        return Addclass ();
      case 4:
        return Addchapter();
      case 5:
        return Addsubject();
      default:
        return Container();
    }
  }
}

