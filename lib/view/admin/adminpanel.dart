import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../../controllers/admincontroller.dart/admincontroller.dart';


class Adminpanel extends StatelessWidget {
  final AdminController _controller = Get.put(AdminController());

   Adminpanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Add MCQS',
            icon: Icons.add,
          ),
          AdminMenuItem(
            title: 'Add TITLE',
            icon: Icons.add,
            
          ),
          AdminMenuItem(
            title: 'Add Class',
            icon: Icons.add,
          ),
          AdminMenuItem(
            title: 'Add Chapter',
            icon: Icons.add,
            
          ),
          AdminMenuItem(
            title: 'Add Subject',
            icon: Icons.add,
            
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          switch(item.title){
            case 'Dashboard':
            _controller.changePage(0);
            break;
            case 'Add MCQS':
            _controller.changePage(1);
            break;
            case 'Add TITLE':
            _controller.changePage(2);
            break;
            case 'Add Class':
            _controller.changePage(3);
            break;
            case 'Add Chapter':
            _controller.changePage(4);
            break;
            case 'Add Subject':
            _controller.changePage(5);
            break;
          }
        },
      ),
      body: Obx(() {
        return _controller.getPage(_controller.selectedPageIndex.value);
      }),
    );
  }}