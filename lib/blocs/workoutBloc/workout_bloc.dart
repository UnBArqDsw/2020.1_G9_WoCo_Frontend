import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:WoCo/models/workout.dart';
import 'package:WoCo/repository/workout/workoutRepository.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(InitialState());
  final WorkoutRepository repository = new WorkoutRepository();

  // WorkoutBloc(this.repository);
  // @override
  // WorkoutState get initialState => LoadingState();

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    LoadingState();
    if (event is LoadingSucessWorkoutEvent) {
      yield* _mapWorkoutsLoadedToState();
    } else if (event is CreateWorkoutEvent) {
      yield* _mapWorkoutAddedToState(event);
    } else if (event is UpdateWorkoutEvent) {
      yield* _mapWorkoutUpdatedToState(event);
    } else if (event is DeleteWorkoutEvent) {
      yield* _mapWorkoutDeletedToState(event);
    }
  }

  Stream<WorkoutState> _mapWorkoutsLoadedToState() async* {
    try {
      var workouts = (await this.repository.getAllWorkouts());
      yield LoadedSucessState(workouts);
    } catch (_) {
      yield ErrorState("error loading Workout");
    }
  }

  Stream<WorkoutState> _mapWorkoutAddedToState(
      CreateWorkoutEvent event) async* {
    try {
      if (state is LoadedSucessState) {
        var newWorkout = (await this.repository.createWorkout(event.workout));
        List<Workout> updatedWorkouts;
        if (newWorkout != null) {
          updatedWorkouts = List.from((state as LoadedSucessState).workout)
            ..add(newWorkout);

          yield LoadedSucessState(updatedWorkouts.reversed.toList());
        }
      }
    } catch (_) {
      yield ErrorState("error Add workout");
    }
  }

  Stream<WorkoutState> _mapWorkoutUpdatedToState(
      UpdateWorkoutEvent event) async* {
    try {
      if (state is LoadedSucessState) {
        var updatedWorkout =
            (await this.repository.updateWorkout(event.workout));
        if (updatedWorkout != null) {
          final List<Workout> updatedWorkouts =
              (state as LoadedSucessState).workout.map((workout) {
            return workout.id == updatedWorkout.id ? updatedWorkout : workout;
          }).toList();

          yield LoadedSucessState(updatedWorkouts);
        }
      }
    } catch (_) {
      yield ErrorState("error update workout");
    }
  }

  Stream<WorkoutState> _mapWorkoutDeletedToState(
      DeleteWorkoutEvent event) async* {
    try {
      if (state is LoadedSucessState) {
        final deleteWorkout = (state as LoadedSucessState)
            .workout
            .where((workout) => workout.id != event.workout.id)
            .toList();
        yield LoadedSucessState(deleteWorkout);
      }
    } catch (_) {
      yield ErrorState("error delete workout");
    }
  }
}
