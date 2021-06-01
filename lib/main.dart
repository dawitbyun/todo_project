import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>TaskData(),   //taskdata is an object //하위 위젯 트리들은 다 들을 수 있음
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
