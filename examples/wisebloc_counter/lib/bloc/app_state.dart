part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class MasterCounterNavigation extends AppState {
  @override
  List<Object> get props => [];
}

class SlaveCounterNavigation extends AppState {
  @override
  List<Object> get props => [];
}
