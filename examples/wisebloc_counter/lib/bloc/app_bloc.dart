import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';
import 'package:wisebloc_counter/views/MasterCounter/MasterCounter.dart';
import 'package:wisebloc_counter/views/SlaveCounter/SlaveCounter.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  final AppHandler appHandler;

  AppBloc(@required this.appHandler)
      : assert(appHandler != null);

  @override
  AppState get initialState => AppInitial();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {

    if (event is InitializeApp) {

      appHandler.masterCounter.counter = 0; // Initialize master counter to 0
      appHandler.slaveCounter.counter = 0;  // Initialize master counter to 0

      yield MasterCounterNavigation();      // Navigate to the homepage of the app after initialization

    }
    
    else if (event is NavigateTo) {

      if (event.destination is MasterCounter) {
        yield MasterCounterNavigation();
      }

      else if (event.destination is SlaveCounter) {
        yield SlaveCounterNavigation();
      }

    }

  }
}

