class BodyWorkout {
  final String imagePath, name, instruction;

  BodyWorkout({this.imagePath, this.name, this.instruction});
}

final chestWorkout = [
  BodyWorkout(
    imagePath: "assets/chest.png",
    name: "Bench press",
    instruction: "3 sets - 6 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/chest.png",
    name: "Dumbell press",
    instruction: "4 sets - 6 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/chest.png",
    name: "Dips",
    instruction: "2 sets - 10 repitions",
  ),
];

final backWorkout = [
  BodyWorkout(
    imagePath: "assets/back.png",
    name: "Pull ups",
    instruction: "2 sets - 8 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/back.png",
    name: "Deadlift",
    instruction: "2 sets - 4 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/back.png",
    name: "Lat pulldown",
    instruction: "4 sets - 6 repitions",
  ),
];

final bicepsWorkout = [
  BodyWorkout(
    imagePath: "assets/biceps.png",
    name: "Pull ups",
    instruction: "2 sets - 8 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/biceps.png",
    name: "Deadlift",
    instruction: "2 sets - 4 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/biceps.png",
    name: "Lat pulldown",
    instruction: "4 sets - 6 repitions",
  ),
];

final tricepsWorkout = [
  BodyWorkout(
    imagePath: "assets/biceps.png",
    name: "hummer",
    instruction: "2 sets - 8 repitions",
  ),
];

final legsWorkout = [
  BodyWorkout(
    imagePath: "assets/legs.png",
    name: "Step-ups",
    instruction: "2 sets - 8 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/legs.png",
    name: "Box jumps",
    instruction: "2 sets - 4 repitions",
  ),
  BodyWorkout(
    imagePath: "assets/legs.png",
    name: "Speedskater jumps",
    instruction: "4 sets - 6 repitions",
  ),
];

final allExercises = [
  [
    BodyWorkout(
      imagePath: "assets/chest.png",
      name: "Bench press",
      instruction: "3 sets - 6 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/chest.png",
      name: "Dumbell press",
      instruction: "4 sets - 6 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/chest.png",
      name: "Dips",
      instruction: "2 sets - 10 repitions",
    ),
  ],
  [
    BodyWorkout(
      imagePath: "assets/back.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/back.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/back.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
  [
    BodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/biceps.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
  [
    BodyWorkout(
      imagePath: "assets/biceps.png",
      name: "hummer",
      instruction: "2 sets - 8 repitions",
    )
  ],
  [
    BodyWorkout(
      imagePath: "assets/legs.png",
      name: "Step-ups",
      instruction: "2 sets - 8 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/legs.png",
      name: "Box jumps",
      instruction: "2 sets - 4 repitions",
    ),
    BodyWorkout(
      imagePath: "assets/legs.png",
      name: "Speedskater jumps",
      instruction: "4 sets - 6 repitions",
    ),
  ]
];
