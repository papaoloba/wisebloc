import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_bloc.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisebloc_counter/views/MasterCounter/bloc/master_counter_bloc.dart';
import 'package:wisebloc_counter/views/SlaveCounter/SlaveCounter.dart';
import 'package:wisebloc_counter/views/MasterCounter/MasterCounter.dart';
import 'package:wisebloc_counter/views/SlaveCounter/bloc/slave_counter_bloc.dart';


void main() {

  final appHandler = AppHandler();

  runApp(MultiBlocProvider(
    providers: [

    BlocProvider(
    create: (context) => AppBloc(appHandler)),

    BlocProvider(
    create: (context) => MasterCounterBloc(appHandler)),

    BlocProvider(
    create: (context) => SlaveCounterBloc(appHandler)),
    ],
    child: App(appHandler),
    ),
  );

}

class App extends StatelessWidget {

  final AppHandler appHandler;

  App(@required this.appHandler, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'WiseBLoC counter',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {

              if (state is AppInitial) {
                return MasterCounter(appHandler: appHandler);
              }

              else if (state is MasterCounterNavigation) {
                return MasterCounter(appHandler: appHandler);
              }

              else if (state is SlaveCounterNavigation) {
                return SlaveCounter(appHandler: appHandler);
              }              

            } 

      )

    );
  }

}