import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseair_platform/pages/HomePage/bloc/homepage_bloc.dart';
import 'package:wiseair_platform/utils/navigation.dart';

import 'bloc/app_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
          providers: [
            // INSERT HERE ALL THE PAGE BLOCS
            BlocProvider(create: (context) => AppBloc()),
            BlocProvider(create: (context) => HomePageBloc()),
          ],
          child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wiseair Platform",
      navigatorKey: Navigation().navigatorKey,
      builder: (context,child) => child,
      initialRoute: Pages.homePage,
      onGenerateRoute: generateRoute,
    );
  }
}