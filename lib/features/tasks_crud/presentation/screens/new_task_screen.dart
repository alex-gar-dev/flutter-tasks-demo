import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/data/models/task.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/cubit/tasks_cubit.dart';
import 'package:tasks_demo_flutter/features/tasks_crud/presentation/widgets/widgets.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({
    super.key
  });
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final date = TextEditingController();
  final comments = TextEditingController();
  final description = TextEditingController();
  bool isCompleted = false;
  List<String> tags = [];

  @override
  void dispose() {
    title.dispose();
    date.dispose();
    comments.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('New task'),
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
                  keyboardType: TextInputType.name,
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
                const ListenerOperationTask(),
                StatefulBuilder(
                  builder: (_, setState) => UXDSFormTags(
                    labelText: 'Tags',
                    helperText: 'Press enter to add tag',
                    onAddedTag: (ts) {
                      setState(() => tags = ts);
                    }
                  ),
                ),
                StatefulBuilder(
                  builder: (_, setState) => 
                    UxdsFormInputSwitch(
                      label: 'Switch on when task is completed',
                      onChanged: (value) {
                        setState(() => isCompleted = value);
                      }
                    )
                )
              ],
            )
          ),
        ),
      ),
      bottomNavigationBar: UXDSFormButton(
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          print(tags);
          context.read<TasksCubit>().addTask(
            task: Task(
              id: 0,
              title: title.value.text, 
              date: date.value.text,
              comments: comments.value.text,
              description: description.value.text,
              isCompleted: isCompleted,
              tags: tags
            )
          );
        },    
        label: 'Guardar'
      ),
    );
  }

}