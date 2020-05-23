import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_bloc.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';

import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';
import 'package:wisebloc_counter/custom_widgets/StandardLoadingScreen.dart';
import 'package:wisebloc_counter/views/MasterCounter/MasterCounter.dart';
import 'package:wisebloc_counter/views/SlaveCounter/bloc/slave_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlaveCounter extends StatelessWidget {
  SlaveCounter({this.appHandler, Key key,}) : super(key: key);

  final AppHandler appHandler;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlaveCounterBloc, SlaveCounterState>(
      builder: (context, state) {

        if (state is SlaveCounterInitial) {
          return buildInitial(context);
        } else if (state is SlaveCounterLoading) {
          return buildLoading(context,appHandler);
        } else if (state is SlaveCounterInitialized) {
          return buildInitialized(context,appHandler);
        }

      },
    );

  }
}

Widget buildInitial(context) {
  BlocProvider.of<SlaveCounterBloc>(context).add(InitializeSlaveCounter());
  return StandardLoadingScreen();
}


Widget buildLoading(BuildContext context, AppHandler appHandler) {

  if (appHandler.slaveCounter.initialized) {
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

  final state = appHandler.slaveCounter.state;
  
  if ( state == SlaveCounterPlainCounter ) {
  return buildPlainCounter(context, appHandler);
  }

}

Widget buildPlainCounter(BuildContext context, AppHandler appHandler) {

  return Scaffold(
      appBar: AppBar(
        title: Text("Slave Counter"),
        leading: IconButton(
          icon: Icon(Icons.home), 
          onPressed: () {
            BlocProvider.of<AppBloc>(context).add(NavigateTo(MasterCounter()));
          }),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incrementing the slave counter doesn't affect the master counter:",
            textAlign: TextAlign.center,
            ),
            Text(
              appHandler.slaveCounter.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SlaveCounterBloc>(context).add(IncrementButtonPressed());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

}