import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studioprojects/classes/taskdo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/classes/taskdonot.dart';

class EditTask extends StatefulWidget {
  late String? add;
  late int index;
  EditTask({
    required this.index,
    required this.add,
    Key? key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>() ;
    var titleController = TextEditingController(text: Hive.box<TaskDoNot>("taskDoNot").getAt(widget.index)!.title );
    var descriptionController = TextEditingController(text: Hive.box<TaskDoNot>("taskDoNot").getAt(widget.index)!.description);
    print("girdieditign");
    if (widget.add=="Do"){
      print("do ya girdik");
      return Scaffold(
        appBar: AppBar(
          title: const Text("edit task"),
          titleSpacing: 70,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "yaz aq";
                        }
                      },
                      controller: titleController,
                      decoration: const InputDecoration(
                        //label: Text("title"),
                        //hintText: "add a title"
                      ),
                    ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "yaz aq";
                          }
                        },
                        controller: descriptionController,
                        minLines: 1,
                        maxLines: 7,
                        decoration: const InputDecoration(
                          //label: Text("description"),
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
            if(formKey.currentState!.validate()){
              if(widget.add == "Do"){
                Hive.box<TaskDo>("taskDo").putAt(widget.index,TaskDo(titleController.text, descriptionController.text,false));
                Navigator.of(context).pop();}else{
                Hive.box<TaskDoNot>("taskDoNot").putAt(widget.index,TaskDoNot(titleController.text, descriptionController.text, false));
                Navigator.of(context).pop();
              }

            }







          },
          child: const Icon(Icons.edit_rounded),
        ),
      );
    }else{
      print("donot a grdik");
      return Scaffold(
      appBar: AppBar(
        title: const Text("edit task"),
        titleSpacing: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Bos birakma aq";
                      }
                    },

                    controller: titleController,
                    decoration: const InputDecoration(
                      //label: Text("title"),
                      //hintText: "add a title"
                    ),
                  ),
                    const SizedBox(height: 20,),
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Bos birakma aq";
                          }
                        },
                      controller: descriptionController,

                      minLines: 1,
                      maxLines: 7,
                      decoration: const InputDecoration(
                        //label: Text("description"),
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
          if(formKey.currentState!.validate()){
            if(widget.add == "Do"){
              Hive.box<TaskDo>("taskDo").putAt(widget.index,TaskDo(titleController.text, descriptionController.text,false));
              Navigator.of(context).pop();}else{
              Hive.box<TaskDoNot>("taskDoNot").putAt(widget.index,TaskDoNot(titleController.text, descriptionController.text, false));
              Navigator.of(context).pop();
          }

          }






        },
        child: const Icon(Icons.edit_rounded),
      ),
    );

    }


  }
}
