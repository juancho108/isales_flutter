import 'package:flutter/foundation.dart';

class Activity {
  String? name, type;
  int id, classId;
  String dataAgendada;
  String hora;
  

  Activity({
    required this.id,
    required this.classId,
    required this.dataAgendada,
    required this.hora,
    this.name,
    this.type,
  });
}
