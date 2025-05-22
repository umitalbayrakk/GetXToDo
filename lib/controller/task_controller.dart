import 'package:flutter_getx_todo_statemanagmnet/model/task_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  //MARK: Format Date...
  DateTime now = DateTime.now();
  String formattedDate = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  // add Task to list..
  void addTask(String title, String description) {
    taskList.add(Task(title: title, description: description)); //
  }

  void toggleTaskCompleted(int index) {
    taskList[index].isComplete = !taskList[index].isComplete;
    taskList.refresh();
  }

  void deleleteTask(int index) {
    taskList.removeAt(index);
  }
}
