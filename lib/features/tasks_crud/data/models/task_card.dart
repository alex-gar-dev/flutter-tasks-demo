import 'package:tasks_demo_flutter/core/utils/parser_dates.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/models/task_interface.dart';

class TaskCard extends TaskInterface {

  TaskCard({
    required super.id,
    required super.title,
    required super.isCompleted,
    super.date
  });

  factory TaskCard.fromMap(Map<String, dynamic> map) 
    => TaskCard(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isCompleted: (map['is_completed'] ?? 0) == 1,
      date: ParserDates.parseDate(date: map['due_date'] ?? '')
    );
  
  TaskCard copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) => TaskCard(
    id: id ?? this.id,
    title: title ?? this.title,
    isCompleted: isCompleted ?? this.isCompleted
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'is_completed': isCompleted ? 1 : 0,
    'due_date': ParserDates.parseDate(
      date: date ?? '',
      initalFormat: 'dd/MM/yyyy',
      format: 'yyyy-MM-dd'
    )
  };

}