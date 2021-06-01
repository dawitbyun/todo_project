import 'package:flutter/material.dart';  // material.dart includes foundation.dart
import 'package:provider/provider.dart';
import 'task.dart';
import 'dart:collection';  // unmodifiablelistview comes from collections


//provide this tasks property across my app

class TaskData extends ChangeNotifier { //taskdata라는 개념. taskdata는 또한 object
  List<Task> _tasks = [  //tasks는 정property이다. 그 중에서도 객체와 객체사이의 연결?   //list는 object이다. 그래서 private하게 만들어서캡슐화를 시킴.
    Task(name: 'study flutter' ),  // checkbox는 default로 not done 설정되어있다. //name이 좀 더 속성에 가깝다.
    Task(name: 'read a chapter'),  //Task property이다.
    Task(name: 'exercise'),
  ];

  UnmodifiableListView<Task> get tasks {       //it is a view of another list. It is like a window pannel
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {  //캡슐화.  //taskcount is a property
    return _tasks.length;
  }

  void addTask(String newTaskTitle){   //method는 행동, 객체는 여러가지 행동을 할 수 있나? 객체가 다른 객체랑 소통하는 것은 property를 통해서만 할수 있나?
    final task = Task(name: newTaskTitle); //Task가 새로운 객체
    _tasks.add(task);
    // print(task.runtimeType); // 변수형을 말해줌
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}