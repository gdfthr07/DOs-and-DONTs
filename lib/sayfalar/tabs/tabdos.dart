import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/sayfalar/actions/adding_task.dart';
import 'package:studioprojects/sayfalar/actions/showing_task.dart';
import 'package:studioprojects/classes/taskdo.dart';

class TabDos extends StatefulWidget {
  const TabDos({Key? key}) : super(key: key);

  @override
  _TabDosState createState() => _TabDosState();
}

class _TabDosState extends State<TabDos> {
  @override
  Widget build(BuildContext context) {
    print("scaffoldtabdos");
    var add = "Do";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("to Do's"),
          titleSpacing: 150,
          backgroundColor: Colors.white30,
          foregroundColor: Colors.lightGreen,
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<TaskDo>("taskDO").listenable(),
          builder: (context, Box<TaskDo> box, _){
            return ListView.builder(
              itemCount: box.length,
                itemBuilder: (context, index){
                  final boxNesnesi = box.getAt(index);
                  return Card(
                    child: ListTile(
                      onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShowTask(index: index,add: add,),));
                      },

                    trailing: GestureDetector(
                      onTap: (){
                        Hive.box<TaskDo>("taskDO").deleteAt(index);
                      },
                        child: const Icon(Icons.delete_rounded)),
                      leading: Checkbox(
                        value: boxNesnesi!.isDone,
                        onChanged: (bool? a){
                          Hive.box<TaskDo>("taskDo").putAt(index, TaskDo(boxNesnesi.title, boxNesnesi.description, a!));
                        },
                      ),
                      title: Text(boxNesnesi.title.toString()),
                    ),
                  );
                }
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder:(context) =>  AddTask(add: add,) ));
        }, label: const Text("tap to add new task")),
      ),
    );
  }
}
