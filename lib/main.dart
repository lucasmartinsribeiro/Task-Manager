import 'package:task_manager/form.dart';
import 'package:flutter/material.dart';
import 'task_controller.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    theme: ThemeData(primarySwatch: Colors.red),
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
          itemBuilder: (BuildContext, index) {
            return Card(
              child: ListTile(
                title: Text(TaskController.list[index].title),
                subtitle: Text(TaskController.list[index].description),
                // calendar: Text(TaskController.list[index].calendar),
              ),
            );
          },
          itemCount: TaskController.list.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callScreen(context, const MyTask());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

callScreen(BuildContext context, StatefulWidget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}