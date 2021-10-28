import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ToDoList()));
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // a controller to the input text field
  final TextEditingController listitemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('To Do List')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
                child: Column(children: [
              Form(
                key:formKey,
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                        hintText: 'Type New Task',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.text,
                      controller: listitemController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                        child: Text('Add'),
                        onPressed: () {
                          debugPrint('Clicked');
                          //no limit on what you want to print
                          //or just print ('Clicked'); which limits the # of characters
                          if (formKey.currentState!.validate()) {
                                //debugPrint('You entered ' + listitemController.text);
                            setState(() {
                              _tasks.add(listitemController.text);
                            });
                            }},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(color: Colors.white),
                        )),
                  )
                ]),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _tasks.length,
                        itemBuilder: (context,index){
                        return Card(child:ListTile(
                          title: Text(_tasks[index]),
                        ));
                        }
            ,
                  )]))));
  }
}
