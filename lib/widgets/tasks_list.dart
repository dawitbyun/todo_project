import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(  //consumer is listening for changes in taskdata. When task data updates its state, the consumer listens and update all the changes.  //TaskData is a data type here
      builder: (context, taskData, child) {  //taskData is an object, child is a property of builder
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (bool checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        ); //when we return it, we use ;
      },

    );
  }
}
