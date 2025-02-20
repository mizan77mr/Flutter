import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _taskList = [];
  bool _showActiveTask = true;

  void _addtask(String task) {
    setState(() {
      _taskList.add({"task": task, "completed": false});
    });
    Navigator.pop(context);
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      _taskList[index]['completed'] = !_taskList[index]['completed'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _taskList.removeAt(index);
    });
  }

  void _editTask(int index, String updateTask) {
    setState(() {
      _taskList[index]['task'] = updateTask;
    });
    Navigator.pop(context);
  }

  int get _activeCount => _taskList.where((task) => !task['completed']).length;
  int get _completedCount =>
      _taskList.where((task) => task['completed']).length;

  void _showTaskDialog({int? index}) {
    TextEditingController _taskController = TextEditingController(
      text: index != null ? _taskList[index]['task'] : '',
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.green.shade100,
            title: Text(index != null ? 'Edit Task' : 'Add Task'),
            content: TextField(
              controller: _taskController,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: InputDecoration(hintText: 'Enter Task'),
            ),

            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel', style: TextStyle(color: Colors.black)),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_taskController.text.trim().isNotEmpty) {
                    if (index == null) {
                      _addtask(_taskController.text);
                    } else {
                      _editTask(index, _taskController.text);
                    }
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> _fillterTask = _taskList.where((task) => !task['completed'] !=_showActiveTask).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade300, Colors.red.shade200],
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade200, Colors.green.shade300],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        spreadRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap:(){

                          setState(() {

                            _showActiveTask=false;
                          });
                        },
                        child: Text(
                          'Active Task',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _activeCount.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red.shade200, Colors.green.shade300],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        spreadRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showActiveTask = true;
                          });

                        } ,
                        child: Text(
                          'Complete Task',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _completedCount.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),

          Expanded(
            child: ListView.builder(
              itemCount: _fillterTask.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Dismissible(
                    key: Key(UniqueKey().toString()),
                    onDismissed: (direction) => _deleteTask(index),

                    child: Card(
                      elevation: 5,
                      color: Colors.green[300],
                      child: ListTile(
                       leading: Checkbox(value: _fillterTask[index]['completed'], onChanged: (value)=>_toggleTaskStatus(index)),
                        // CircleAvatar(
                        //   backgroundColor: Colors.red[100],
                        //   child: Text(_fillterTask[index]['task'][0]),
                        // ),

                        title: Text(
                          _fillterTask[index]['task'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat().add_yMMMd().format(DateTime.now()),
                        ),
                        trailing: IconButton(
                          onPressed: ()=>_showTaskDialog(index: index),
                          icon: Icon(Icons.edit)
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.green,
        onPressed: () => _showTaskDialog(),
        child: Icon(Icons.add),
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade100, width: 2),
        ),
        backgroundColor: Colors.red.shade100,
      ),
    );
  }
}
