import 'package:tasks_demo_flutter/core/utils/parser_dates.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/models/task_interface.dart';

class Task implements TaskInterface {
  
  @override
  final int id;
  @override
  final String title;
  @override
  final bool isCompleted;
  @override
  final String? date;
  @override
  final String? comments;
  @override
  final String? description;
  @override
  final List<String>? tags;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.date,
    this.comments,
    this.description,
    this.tags,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    String tags = map['tags'] ?? '';
    return Task(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isCompleted: (map['is_completed'] ?? 0) == 1,
      date: ParserDates.parseDate(date: map['due_date'] ?? ''),
      comments: map['comments'],
      description: map['description'],
      tags: tags.isEmpty ? [] : tags.split(',')
    );
  }
  
  Task copyWith({
    int? id,
    String? title,
    bool? isCompleted,
    String? date,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    isCompleted: isCompleted ?? this.isCompleted,
    date: date ?? this.date
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'is_completed': isCompleted ? 1 : 0,
    'due_date': ParserDates.parseDate(
      date: date ?? '',
      initalFormat: 'dd/MM/yyyy',
      format: 'yyyy-MM-dd'
    ),
    'comments': comments ?? '',
    'description': description ?? '',
    'tags': (tags ?? []).join(',')
  };

}