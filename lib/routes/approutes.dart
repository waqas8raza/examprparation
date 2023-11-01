import 'package:get/get.dart';
import 'package:tryout/Homeclass.dart';
import 'package:tryout/bottombarscreen.dart';
import 'package:tryout/routes/routesname.dart';
import 'package:tryout/view/admin/adminpages/adddata.dart';
import 'package:tryout/view/admin/adminpages/addtitle.dart';
import 'package:tryout/view/admin/adminpanel.dart';
import 'package:tryout/view/chapterscreen.dart';
import 'package:tryout/view/mcqsscreen.dart';
import 'package:tryout/view/quizscreen/quizchapterscreen.dart';
import 'package:tryout/view/quizscreen/quizclasscrenn.dart';
import 'package:tryout/view/quizscreen/quizscreen.dart';
import 'package:tryout/view/quizscreen/quizsubjectscreen.dart';
import 'package:tryout/view/quizscreen/startquizscreen.dart';
import 'package:tryout/view/subjectscreen.dart';
import 'package:tryout/view/classesscreen.dart';
import 'package:tryout/view/splashscreen.dart';

class Approutes{
 static  approutes()=>[
    GetPage(name: Routesnames.splashscreen, page:() =>   const SplashscreenState(),),
    GetPage(name: Routesnames.homescreen, page:() =>    Homescreen(),),
    GetPage(name: Routesnames.bottombarscreen, page:() =>    Bottomnavigationbar(),),
    GetPage(name: Routesnames.classesscreen, page:() =>    Classesscreen(title: '',),),
    GetPage(name: Routesnames.subjectscreen, page:() =>    Subjectscreen(title: '',),),
    GetPage(name: Routesnames.subjectscreen, page:() =>    Chapterscreen(title: '',),),
    GetPage(name: Routesnames.subjectscreen, page:() =>    Mcqsscreen(title: '',sub: '',),),
    GetPage(name: Routesnames.quizscreen, page:() =>    Quizscreen(),),
    GetPage(name: Routesnames.quizclassesscreen, page:()=> QuizClassesscreen(title: '',)),
    GetPage(name: Routesnames.quizsubjectscreen, page:()=> QuizSubjectscreen(title: '',)),
    GetPage(name: Routesnames.quizchapterscreen, page:()=> QuizChapterscreen(title: '',)),
    GetPage(name: Routesnames.startquizmcqsscreen, page:()=> StartquizMcqsscreen(title: '',)),
    GetPage(name: Routesnames.adminpanel, page:() =>   Adminpanel(),),
    GetPage(name: Routesnames.adddata, page:() =>  Adddata(),),
    GetPage(name: Routesnames.addtitle, page:() =>  Addtitle(),),
  ];
}