import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_bloc.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';
import 'package:wisebloc_counter/custom_widgets/StandardLoadingScreen.dart';
import 'package:wisebloc_counter/views/MasterCounter/bloc/master_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisebloc_counter/views/SlaveCounter/SlaveCounter.dart';

class MasterCounter extends StatelessWidget {
  MasterCounter({this.appHandler, Key key,}) : super(key: key);

  final AppHandler appHandler;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterCounterBloc, MasterCounterState>(
      builder: (context, state) {

        if (state is MasterCounterInitial) {
          return buildInitial(context);
        } else if (state is MasterCounterLoading) {
          return buildLoading(context,appHandler);
        } else if (state is MasterCounterInitialized) {
          return buildInitialized(context,appHandler);
        }

      },
    );

  }
}

Widget buildInitial(context) {
  BlocProvider.of<MasterCounterBloc>(context).add(InitializeMasterCounter());
  return StandardLoadingScreen();
}


Widget buildLoading(BuildContext context, AppHandler appHandler) {
  if (appHandler.masterCounter.initialized) {
    return Stack(
      children: <Widget>[
        buildInitialized(context, appHandler),
        Center(child: CircularProgressIndicator())
      ],
    );
  } else {
    return StandardLoadingScreen();
  }
}

Widget buildInitialized(BuildContext context, AppHandler appHandler) {

  final state = appHandler.masterCounter.state;
  
  if (state == MasterCounterPlainCounter) {
  return buildPlainCounter(context, appHandler);
  }
          
}

Widget buildPlainCounter(BuildContext context, AppHandler appHandler) {

  return Scaffold(
      appBar: AppBar(
        title: Text("Master Counter"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right), 
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(NavigateTo(SlaveCounter()));
            }
            )],
      ),
      body: Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
        alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'By incrementing the master counter you are also incrementing the slave counter:',
            textAlign: TextAlign.center,
            ),
            Text(
              appHandler.masterCounter.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<MasterCounterBloc>(context).add(IncrementButtonPressed());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

}