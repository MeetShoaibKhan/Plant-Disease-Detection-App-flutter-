
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/screens/firstscreen.dart';

class AppRoutes {
  static const splashScreen = "/orderdetails";
  static const secondscreen = "/secondscreen";


  static final appRoutes = {
    '/': (context) => OrderDetails(),
    secondscreen: (context) => MyHomePage(title: 'Plant disease detection',),

  };
}
