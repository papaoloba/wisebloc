import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseair_platform/bloc/app_handler.dart';

import 'bloc/homepage_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {

        if (state is HomePageInitial) {
          return buildInitial(context);
        }
        else if (state is HomePageLoading) {
          return buildLoading(context);
        }
        else if (state is HomePageInitialized) {
          return buildInitialized(context);
        }

      },

    );

  }


Widget buildInitial(BuildContext context) {
  BlocProvider.of<HomePageBloc>(context).add(InitializeHomePage());
  return Container();
}
Widget buildLoading(BuildContext context) {
  return Container();
}
Widget buildInitialized(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: Text("Demo App"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  AppHandler().homePageHandler.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {BlocProvider.of<HomePageBloc>(context).add(IncreaseButtonPressed());},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );  
}


}

