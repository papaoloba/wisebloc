part of 'slave_counter_bloc.dart';

abstract class SlaveCounterEvent extends Equatable {
  const SlaveCounterEvent();
}

class InitializeSlaveCounter extends SlaveCounterEvent {
  List<Object> get props => [];
}

class IncrementButtonPressed extends SlaveCounterEvent {
  List<Object> get props => [];
}