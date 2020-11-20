part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState extends Equatable {
  const WorkoutState();
}

class EmptyState extends WorkoutState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InitialState extends WorkoutState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends WorkoutState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedSucessState extends WorkoutState {
  final List<Workout> workout;
  const LoadedSucessState(this.workout);
  @override
  List<Object> get props => [workout];
}

class ErrorState extends WorkoutState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
