import '../models/activity.dart';

class User {
  String name;
  Activity? activity;

  User({
    required this.name,
    this.activity,
  });
}
