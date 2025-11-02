import 'package:flutter/widgets.dart';
import 'package:proyect_pmm/screens/home_page.dart';
import 'package:proyect_pmm/screens/personal_page.dart';
import 'package:proyect_pmm/screens/widget_page.dart';

Map<String, WidgetBuilder> getRoutes(){
  return rutes;
}

final rutes = <String, WidgetBuilder>{

  '/': (BuildContext context) => HomePage(),
  'personal' : (BuildContext context) => PersonalPage(),
  'widget' : (BuildContext context) => WidgetPage(),


  
};