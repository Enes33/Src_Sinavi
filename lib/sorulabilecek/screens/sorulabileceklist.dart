import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/sorulabilecek/screens/sorulabilecekdetay.dart';
import '../ihelper.dart';

import '../sorulabilecek.dart';



class sorulabileceklist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sorulabileceklistState();
  }
}

class sorulabileceklistState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      // ignore: deprecated_member_use
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
        body: todoListItems(),
        appBar: AppBar(
          title: Text("Sorular"),
            backgroundColor: Colors.blueGrey,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToDetail(Todo("", 3, ""));
          },
          tooltip: 'Soru Ekle',
          child: Icon(Icons.add,
            color: Color(0xFFF5EBE9),),
          backgroundColor: Colors.blue,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) => Card(
            color: Colors.black,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.todos[position].priority),
                child: Text(
                  this.todos[position].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(this.todos[position].title),
              subtitle: Text(this.todos[position].description),
              onTap: () {
                navigateToDetail(this.todos[position]);
              },
            )));
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoDetail(todo)));
    if (result == true) {
      getData();
    }
  }

  void getData() {
    final todosFuture = helper.getTodos();
    todosFuture.then((result) => {
      setState(() {
        todos = result;
        count = todos.length;
      })
    });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.green;
    }
  }
}