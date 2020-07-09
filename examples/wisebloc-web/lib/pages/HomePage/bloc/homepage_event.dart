part of 'homepage_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class InitializeHomePage extends HomePageEvent {
List<Object> get props => [];
}

class IncreaseButtonPressed extends HomePageEvent {
List<Object> get props => [];
}

