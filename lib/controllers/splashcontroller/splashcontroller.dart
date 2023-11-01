import 'package:get/get.dart';
import 'package:tryout/bottombarscreen.dart';

class Splashcontroller extends GetxController{
  Future movenext()async{
await Future.delayed(const Duration(seconds: 3));
Get.off( Bottomnavigationbar());
  }
}