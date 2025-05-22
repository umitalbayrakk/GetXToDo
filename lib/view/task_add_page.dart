import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_statemanagmnet/controller/task_controller.dart';
import 'package:flutter_getx_todo_statemanagmnet/utils/color.dart';
import 'package:get/instance_manager.dart';

class TaskAddPage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TaskAddPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          "Görev Ekle",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              cursorColor: AppColors.borderColor,
              controller: textController,
              decoration: InputDecoration(
                hintText: "Görev Baslığı",
                labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                filled: true,
                fillColor: AppColors.textFiledColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              style: Theme.of(context).inputDecorationTheme.labelStyle,
              cursorColor: AppColors.borderColor,
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Açıklama Ekle (opsiyonel)",
                labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                filled: true,
                fillColor: AppColors.textFiledColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => taskController.addTask(textController.text, descriptionController.text),
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(AppColors.foodCard),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              ),
              child: Text(
                "Ekle",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteSpot),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
