part of 'master_counter_bloc.dart';

abstract class MasterCounterState extends Equatable {
  const MasterCounterState();
}

class MasterCounterInitial extends MasterCounterState {
  @override
  List<Object> get props => [];
}

class MasterCounterLoading extends MasterCounterState {
  @override
  List<Object> get props => [];
}

class MasterCounterInitialized extends MasterCounterState {
  @override
  List<Object> get props => [];
}

class MasterCounterPlainCounter extends MasterCounterState {
  @override
  List<Object> get props => [];
}
