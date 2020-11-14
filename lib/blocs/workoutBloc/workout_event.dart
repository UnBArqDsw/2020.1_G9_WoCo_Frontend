part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();
}

class LoadingSucessWorkoutEvent extends WorkoutEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetWorkoutEvent extends WorkoutEvent {
  final String id;
  const GetWorkoutEvent(this.id);
  @override
  List<Object> get props => [];
}

class CreateWorkoutEvent extends WorkoutEvent {
  final Workout workout;
  const CreateWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

class UpdateWorkoutEvent extends WorkoutEvent {
  final Workout workout;
  const UpdateWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

class DeleteWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  const DeleteWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

class NetworkErrorEvent extends Error {}
