import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wisebloc_counter/wisebloc_utils.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';

part 'slave_counter_event.dart';
part 'slave_counter_state.dart';

class SlaveCounterBloc extends Bloc<SlaveCounterEvent, SlaveCounterState> {
  
  final AppHandler appHandler;

  SlaveCounterBloc(@required this.appHandler)  : assert(appHandler != null);

  @override
  SlaveCounterState get initialState => SlaveCounterInitial();

  @override
  Stream<SlaveCounterState> mapEventToState(
    SlaveCounterEvent event,
  ) async* {
    
    yield SlaveCounterLoading();

    if (event is InitializeSlaveCounter) {

      await Future.delayed(Duration(seconds: 2));
      yieldState(appHandler.slaveCounter, SlaveCounterPlainCounter);

    }

    else if (event is IncrementButtonPressed) {

      await Future.delayed(Duration(seconds: 1));
      appHandler.slaveCounter.counter++;
      
    }

    appHandler.slaveCounter.initialized = true;
    yield SlaveCounterInitialized();

  }
}