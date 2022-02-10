import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studioprojects/classes/taskdo.dart';
import 'package:studioprojects/classes/taskdonot.dart';
import 'package:studioprojects/sayfalar/tabs/tabdonts.dart';
import 'package:studioprojects/sayfalar/tabs/tabdos.dart';

import 'actions/showing_task.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tab_list = [TabDos(),TabDonts()];
  int tab_list_i = 0;
  var a = Hive.box<TaskDo>("taskDo").listenable();
  var b = Hive.box<TaskDoNot>("taskDoNot").listenable();

  @override
  Widget build(BuildContext context) {
    print("homeScaff");
    if (tab_list_i==0){

      return Scaffold(
        appBar: AppBar(
          title: Text("to Do's and Dont's"),
        ),
        drawer: Drawer(
          child: ValueListenableBuilder(
            valueListenable: a,
            builder: (context, Box<TaskDo> box, _){

              var add = "Do";
              return ListView.builder(
                  itemCount:box.length,
                  itemBuilder: (context,index){
                    final boxx = box.getAt(index);
                    return Card(child: ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowTask(index: index,add: add,),));
                      },
                      title: Text(boxx!.title),
                    ),);});
            }),
        ),
        body: tab_list[tab_list_i],
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: MouseCursor.defer,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_rounded),
              label: "Do's",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warning_amber_rounded),
              label: "Don'ts",

            )
          ],
          currentIndex: tab_list_i,
          backgroundColor: Colors.white30,


          onTap: (index){
            setState(() {
              tab_list_i = index ;
            });
          },

        ),



      );
    }else{
      var add = "DoNot";
      return Scaffold(
        appBar: AppBar(
          title: Text("to Do's and Dont's"),
        ),
        drawer: Drawer(
          child: ValueListenableBuilder(
            valueListenable: b,
            builder: (context, Box<TaskDoNot> box, _){
              return  ListView.builder(
                  itemCount:box.length,
                  itemBuilder: (context,index){
                    final boxx = box.getAt(index);
                    return Card(child: ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowTask(index: index,add: add,),));
                      },
                      title: Text(boxx!.title),
                    ),);});
            }
            ),
        ),
        body: tab_list[tab_list_i],
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: MouseCursor.defer,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_rounded),
              label: "Do's",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warning_amber_rounded),
              label: "Don'ts",

            )
          ],
          currentIndex: tab_list_i,
          backgroundColor: Colors.white30,


          onTap: (index){
            setState(() {
              tab_list_i = index ;
            });
          },

        ),



      );
    }
  }
}



