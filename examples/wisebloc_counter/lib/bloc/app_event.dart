part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class NavigateTo extends AppEvent {

  Widget destination;

  NavigateTo(this.destination);

    List<Object> get props => [destination];

}

class InitializeApp extends AppEvent {

    List<Object> get props => [];

}