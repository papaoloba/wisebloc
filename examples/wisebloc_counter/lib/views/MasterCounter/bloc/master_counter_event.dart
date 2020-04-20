part of 'master_counter_bloc.dart';

abstract class MasterCounterEvent extends Equatable {
  const MasterCounterEvent();
}

class InitializeMasterCounter extends MasterCounterEvent {
  List<Object> get props => [];
}

class IncrementButtonPressed extends MasterCounterEvent {
  List<Object> get props => [];
}
