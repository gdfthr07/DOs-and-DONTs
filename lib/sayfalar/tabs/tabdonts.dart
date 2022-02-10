import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/classes/taskdonot.dart';
import 'package:studioprojects/sayfalar/actions/adding_task.dart';
import 'package:studioprojects/sayfalar/actions/showing_task.dart';



class TabDonts extends StatefulWidget {
  const TabDonts({Key? key}) : super(key: key);

  @override
  _TabDontsState createState() => _TabDontsState();
}

class _TabDontsState extends State<TabDonts> {
  @override
  Widget build(BuildContext context) {
    print("scaffoldtabdonts");
    var add = "DoNot";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("to Don'ts"),
          titleSpacing: 130,
          backgroundColor: Colors.white30,
          foregroundColor: Colors.lightGreen,
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<TaskDoNot>("taskDoNot").listenable(),
          builder: (context, Box<TaskDoNot> box, _){
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
                            Hive.box<TaskDoNot>("taskDoNot").deleteAt(index);
                          },
                          child: Icon(Icons.delete_rounded)),
                      leading: Checkbox(
                        value: boxNesnesi!.isDone,
                        onChanged: (bool? a){
                          Hive.box<TaskDoNot>("taskDoNot").putAt(index,
                              TaskDoNot(boxNesnesi.title, boxNesnesi.description, a!));
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
