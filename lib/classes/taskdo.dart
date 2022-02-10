import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'taskdo.g.dart';

@HiveType(typeId: 0)

class TaskDo {
  @HiveField(0)
  String title  ;
  @HiveField(1)
  String description ;
  @HiveField(2)
  bool isDone ;

  TaskDo(this.title, this.description, this.isDone);
}