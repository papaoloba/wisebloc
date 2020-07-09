
import 'package:wiseair_platform/pages/HomePage/bloc/homepage_handler.dart';

class AppHandler {

  static final AppHandler appHandler = new AppHandler.initialize();
  factory AppHandler() {return appHandler;}
  AppHandler.initialize();

  // ATTRIBUTES

  HomePageHandler homePageHandler = HomePageHandler();

}