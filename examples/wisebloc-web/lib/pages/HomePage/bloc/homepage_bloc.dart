import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseair_platform/bloc/app_handler.dart';

part 'homepage_state.dart';
part 'homepage_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {

    yield HomePageLoading();

    if (event is InitializeHomePage) {

    }

    if (event is IncreaseButtonPressed) {

      AppHandler().homePageHandler.counter++;

    }

    AppHandler().homePageHandler.initialized = true;
    yield HomePageInitialized();
  }

}