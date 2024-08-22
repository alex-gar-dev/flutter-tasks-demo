abstract class TaskInterface {
  
  final String id;
  final String title;
  final bool isCompleted;
  final String? date;
  final String? comments;
  final String? description;
  final List<String>? tags;

  TaskInterface({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.date,
    this.comments,
    this.description,
    this.tags
  });
  

}