import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/domain/repository/task_repository_interface.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/cubit/tasks_cubit.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/widgets/widgets.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class DetailTaskScreen extends StatefulWidget {
  final int id;
  const DetailTaskScreen({
    required this.id,
    super.key
  });
  @override
  State<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends State<DetailTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final date = TextEditingController();
  final comments = TextEditingController();
  final description = TextEditingController();
  late bool isCompleted;
  late List<String> tags;
  final _taskRepository = GetIt.instance<TaskRepositoryInterface>();

  @override
  void dispose() {
    title.dispose();
    date.dispose();
    comments.dispose();
    description.dispose();
    super.dispose();
  }

  Future<Task?> getTask() async {
    final Task? t = await _taskRepository.getTask(id: widget.id);
    if (t is Task) {
      title.text = t.title;
      date.text = t.date ?? '';
      comments.text = t.comments ?? '';
      description.text = t.description ?? '';
      isCompleted = t.isCompleted;
      tags = t.tags ?? [];
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTask(),
      builder: (context, data) {
        if (data.connectionState == ConnectionState.done) {
          if (data.hasData) {
            return UXDSScaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    context.pop();
                  },
                ),
                actions: [
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      UXDSPopupConfirm.showAlertDialog(
                        context: context, 
                        onPressedConfirm: () async {
                          context.read<TasksCubit>().deleteTask(id: widget.id);
                          context.pop();
                        }, 
                        onPressedCancel: () {
                          context.pop();
                        }
                      );
                    }, 
                    icon: const Icon(Icons.delete_forever)
                  )
                ],
                title: const Text('Edit task'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        UXDSFormField(
                          controller: title,
                          labelText: 'Name *',
                          validator: (value) => Validators.validate(
                            value: value,
                            validators: ['required']
                          )
                        ),
                        UXDSFormInputDate(
                          controller: date,
                          labelText: 'Date *',
                          validator: (value) => Validators.validate(
                            value: value,
                            validators: ['required', 'validate_date']
                          )
                        ),
                        const SizedBox(height: 20),
                        UXDSFormField(
                          controller: description,
                          labelText: 'Description',
                          keyboardType: TextInputType.multiline,
                          maxLines: 2
                        ),
                        UXDSFormField(
                          controller: comments,
                          labelText: 'Comments',
                          keyboardType: TextInputType.multiline,
                          maxLines: 2
                        ),
                        const SizedBox(height: 20),
                        StatefulBuilder(
                          builder: (_, setState) => UXDSFormTags(
                            tags: tags,
                            labelText: 'Tags',
                            helperText: 'Press enter to add tag',
                            onAddedTag: (ts) {
                              setState(() => tags = ts);
                            }
                          ),
                        ),
                        const ListenerOperationTask(),
                        StatefulBuilder(
                          builder: (_, setState) => 
                            UxdsFormInputSwitch(
                              isCompleted: isCompleted,
                              label: 'Switch on when task is completed',
                              onChanged: (value) {
                                setState(() => isCompleted = value);
                              }
                            )
                        )
                      ],
                    )
                  )
                ),
              ),
              bottomNavigationBar: UXDSFormButton(
                label: 'Actualizar',
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  print(tags);
                  context.read<TasksCubit>().updateTask(
                    task: Task(
                      id: widget.id,
                      title: title.value.text, 
                      date: date.value.text,
                      comments: comments.value.text,
                      description: description.value.text,
                      isCompleted: isCompleted,
                      tags: tags
                    )
                  );
                }
              ),
            );
          }
          else {
            return UXDSScaffold.scaffoldErrorLoader(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    context.pop();
                  }
                ),
              )
            );
          }
        }
        return UXDSScaffold.scaffoldLoader(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                context.pop();
              }
            ),
          )
        );
      }
    );
  }

}
