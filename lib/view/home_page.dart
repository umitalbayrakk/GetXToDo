import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_statemanagmnet/controller/task_controller.dart';
import 'package:flutter_getx_todo_statemanagmnet/utils/color.dart';
import 'package:flutter_getx_todo_statemanagmnet/view/task_add_page.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  //MARK: TaskController
  final TaskController taskController = Get.put(TaskController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          "GetXToDo",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (context, index) {
            final task = taskController.taskList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
              child: Card(
                color: AppColors.cardColor3,
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(taskController.formattedDate), Text(task.description)],
                  ),
                  title: Text(
                    taskController.taskList[index].title,
                    style: TextStyle(
                      decoration: task.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.buttonColor),
                    onPressed: () => taskController.deleleteTask(index),
                  ),
                  trailing: Checkbox(
                    value: taskController.taskList[index].isComplete,
                    onChanged: (value) {
                      taskController.toggleTaskCompleted(index);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.foodCard,
        foregroundColor: AppColors.whiteSpot,
        onPressed: () => Get.to(() => TaskAddPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
