import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studioprojects/classes/taskdo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/classes/taskdonot.dart';

class AddTask extends StatefulWidget {
  late String add;
   AddTask({
     required this.add,
     Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    print("girdiiiiiiiiiiiiiii");
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
        titleSpacing: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [TextFormField(

                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please write a title";
                      }else{
                        return null;
                      }
                    },
                    controller: titleController,
                    decoration: const InputDecoration(
                      label: Text("title"),
                        //hintText: "add a title"
                    ),
                  ),
                    const SizedBox(height: 20,),
                    TextFormField(
                    controller: descriptionController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please write a description";
                      }else{
                        return null;
                      }
                    },
                    minLines: 1,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      label: Text("description"),
                        //hintText: "add a description"
                    ),
                  )
                  ],
                ),

              ),
            ),
          ],


        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("girdiooooooooo");

          if(_formKey.currentState!.validate()){
            if(widget.add == "Do"){
              Hive.box<TaskDo>("taskDo").add(TaskDo(titleController.text, descriptionController.text, false));
              Navigator.of(context).pop();}else{
              Hive.box<TaskDoNot>("taskDoNot").add(TaskDoNot(titleController.text, descriptionController.text, false));
              Navigator.of(context).pop();
          }
            }else{
            print("cant validate");
          }






        },
        child: const Icon(Icons.add),
      ),
    );

  }
}
