import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/classes/taskdo.dart';
import 'package:studioprojects/classes/taskdonot.dart';
import 'package:studioprojects/sayfalar/actions/editing_task.dart';

class ShowTask extends StatefulWidget {
  late final String add;
  late final int index;

  ShowTask({Key? key, required this.index,required this.add}) : super(key: key);

  @override
  _ShowTaskState createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  @override
  Widget build(BuildContext context) {

    if(widget.add=="Do"){
      return SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<TaskDo>("taskDo").listenable(),
          builder: (context, Box<TaskDo> box, _){
            var box= Hive.box<TaskDo>("taskDo").getAt(widget.index);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> EditTask(add: widget.add,index: widget.index,)));
                  } ,
                  icon: const Icon(Icons.edit)
                  ),
                ],
                title: Text(box!.title.toString()),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.53),
                      child: Text(box.description.toString(),
                        style: const TextStyle(fontSize: 15) ,),
                    ),
                    const SizedBox(height: 20,),
                    RadioListTile(

                        title: const Text("Done"),
                        value: true,
                        groupValue:box.isDone,
                        onChanged:(bool? k){
                          Hive.box<TaskDo>("taskDo").putAt(widget.index,TaskDo(box.title, box.description, k! ));}
                    ),
                    RadioListTile(
                        title: const Text("Not Yet"),
                        value: false,
                        groupValue: box.isDone,
                        onChanged:(bool? k){Hive.box<TaskDo>("taskDo").putAt(widget.index,TaskDo(box.title, box.description, k! ));}
                    )

                  ],
                ),
              ),
            );

          },
        ),
      );
    }else{
      return SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<TaskDoNot>("taskDoNot").listenable(),
          builder: (context, Box<TaskDoNot> box, _){
            var box= Hive.box<TaskDoNot>("taskDoNot").getAt(widget.index);
            return Scaffold(
              appBar: AppBar(
                title: Text(box!.title.toString()),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> EditTask(add: widget.add,index: widget.index,)));
                  } ,
                      icon: const Icon(Icons.edit)
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(box.description.toString(),
                      style: const TextStyle(fontSize: 15) ,),
                    const SizedBox(height: 20,),

                    RadioListTile(

                        title: const Text("Done"),
                        value: true,
                        groupValue:box.isDone,
                        onChanged:(bool? k){
                          Hive.box<TaskDoNot>("taskDoNot").putAt(widget.index,TaskDoNot(box.title, box.description, k! ));}
                    ),
                    RadioListTile(
                        title: const Text("Not Yet"),
                        value: false,
                        groupValue: box.isDone,
                        onChanged:(bool? k){Hive.box<TaskDoNot>("taskDoNot").putAt(widget.index,TaskDoNot(box.title, box.description, k! ));}
                    )

                  ],
                ),
              ),
            );

          },
        ),
      );
    }


  }
}
