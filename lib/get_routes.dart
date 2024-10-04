import 'package:final_project/home_screen.dart';
import 'package:final_project/login_page.dart';
import 'package:final_project/splash_screen.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class GetAppRoute{
  List<GetPage> getRoutes(){
    return[
      GetPage(
        name: AppRoute.initial, 
        page: () => const SplashScreen()
      ),
      GetPage(
        name: AppRoute.secondPage, 
        page: () => const LoginPage()
      ),
      GetPage(
        name: AppRoute.thirdPage, 
        page: () => const HomeScreen()
      ),
      // GetPage(
      //   name: AppRoute.fourtPage, 
      //   page: () => const ForgetLogin()
      // ),
    ];
  }
    
}