import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  StreamController _streamController = StreamController();
  List<String> addData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Stream')),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                final input = _textEditingController.text;
                addData.add(input);
                _streamController.sink.add(addData);
                _textEditingController.clear();
              },
              child: const Text('Add Text'),
              style: ButtonStyle() = ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: _streamController.stream,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            return Card(
                              child: ListTile(
                                title: Text(snapshot.data[index]),
                              ),
                            );
                          });
                    } else {
                      return Center(
                          child: Text(
                        'Empty Data List',
                        style: TextStyle(fontSize: 30),
                      ));
                    }
                  }))
        ],
      ),
    );
  }
}
