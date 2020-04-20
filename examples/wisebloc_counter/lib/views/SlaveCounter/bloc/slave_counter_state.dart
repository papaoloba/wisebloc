part of 'slave_counter_bloc.dart';

abstract class SlaveCounterState extends Equatable {
  const SlaveCounterState();
}

class SlaveCounterInitial extends SlaveCounterState {
  @override
  List<Object> get props => [];
}

class SlaveCounterLoading extends SlaveCounterState {
  @override
  List<Object> get props => [];
}

class SlaveCounterInitialized extends SlaveCounterState {
  @override
  List<Object> get props => [];
}

class SlaveCounterPlainCounter extends SlaveCounterState {
  @override
  List<Object> get props => [];
}
