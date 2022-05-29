import 'package:flutter/material.dart';

enum ActivityType {
  first,
  second,
}

class TypeOfActivity {
  final AssetImage image;
  final String name;
  final ActivityType type;

  TypeOfActivity({
    required this.image,
    required this.name,
    required this.type,
  });
}

final List<TypeOfActivity> activities = [
  TypeOfActivity(image: AssetImage('assets/images/walking.jpg'), name: 'Walking', type: ActivityType.first),
  TypeOfActivity(image: AssetImage('assets/images/running.jpg'), name: 'Running', type: ActivityType.second),
  TypeOfActivity(image: AssetImage('assets/images/cardio_fitness.jpg'), name: 'Cardio Fitness', type: ActivityType.first),
  TypeOfActivity(image: AssetImage('assets/images/workout.jpg'), name: 'Workout', type: ActivityType.second),
  TypeOfActivity(image: AssetImage('assets/images/weightlifting.jpg'), name: 'Weightlifting', type: ActivityType.first),
  TypeOfActivity(image: AssetImage('assets/images/cycling.jpg'), name: 'Cycling', type: ActivityType.second),
  TypeOfActivity(image: AssetImage('assets/images/swimming.jpg'), name: 'Swimming', type: ActivityType.first),
  TypeOfActivity(image: AssetImage('assets/images/basketball.jpg'), name: 'Basketball', type: ActivityType.second),
  TypeOfActivity(image: AssetImage('assets/images/stair_climbing.jpg'), name: 'Stair Climbing', type: ActivityType.first),
];