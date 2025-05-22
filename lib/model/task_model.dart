// MARK: - Task
class Task {
  String title;
  bool isComplete;
  String description;

  Task({required this.description, required this.title, this.isComplete = false});
}
