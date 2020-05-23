import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wisebloc_counter/wisebloc_utils.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';

part 'master_counter_event.dart';
part 'master_counter_state.dart';

class MasterCounterBloc extends Bloc<MasterCounterEvent, MasterCounterState> {
  
  final AppHandler appHandler;

  MasterCounterBloc(@required this.appHandler)  : assert(appHandler != null);

  @override
  MasterCounterState get initialState => MasterCounterInitial();

  @override
  Stream<MasterCounterState> mapEventToState(
    MasterCounterEvent event,
  ) async* {

    yield MasterCounterLoading();

    if (event is InitializeMasterCounter) {

      await Future.delayed(Duration(seconds: 2));
      yieldState(appHandler.masterCounter, MasterCounterPlainCounter);

    }

    else if (event is IncrementButtonPressed) {
      
      await Future.delayed(Duration(seconds: 1));
      appHandler.masterCounter.counter++; // Increment the master counter
      appHandler.slaveCounter.counter++; // Increment the slave counter (in a different screen)
      
    }

    appHandler.masterCounter.initialized = true;
    yield MasterCounterInitialized();

  }
}