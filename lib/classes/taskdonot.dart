import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'taskdonot.g.dart';

@HiveType(typeId: 1)

class TaskDoNot {
  @HiveField(0)
  late String title  ;
  @HiveField(1)
  late String description ;
  @HiveField(2)
  late bool isDone ;

  TaskDoNot(this.title, this.description, this.isDone);
}