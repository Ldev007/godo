import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:godo/core/app_state.dart';
import 'package:godo/src/domain/entities/task.dart';
import 'package:godo/src/presentation/tasks/components/star_button.dart';
import 'package:intl/intl.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({super.key, required this.taskToBeUpdated});

  final Task taskToBeUpdated;
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return StoreConnector<AppState, _ViewModel>(
    //   converter: (store) => _ViewModel(store),
    //   builder: (context, vm) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // TODO: add update task action call here
                throw UnimplementedError();
              },
              child: const Text('Mark completed'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          StarButton(
            onTapped: (isStarred) {
              // TODO: enter logic here to add/remove a task from/to starred tasks
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 30,
                child: Text(
                  'Delete',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                padding: EdgeInsets.only(right: 100, left: 10),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {

          //   },
          //   icon: const Icon(Icons.more_vert),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 24, bottom: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const SingleChildScrollView(
                            child: Column(
                              children: [],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Text('Category'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              TextField(
                controller: titleEditingController,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  hintText: 'Add title',
                ),
              ),
              TextField(
                controller: descriptionEditingController,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.text_snippet_rounded),
                  border: InputBorder.none,
                  hintText: 'Add description',
                ),
              ),
              ListTile(
                onTap: () async {
                  final dateTime = await showDatePicker(
                    context: context,
                    firstDate: taskToBeUpdated.reminder ?? DateTime.now(),
                    lastDate: DateTime(2030),
                    initialDate: taskToBeUpdated.reminder,
                  );

                  // TODO: add call to action to change the date and time of the current task
                  throw UnimplementedError();
                },
                leading: const Icon(Icons.calendar_month),
                title: Text(DateFormat.yMMMEd().add_jm().format(taskToBeUpdated.reminder!)),
              ),
            ],
          ),
        ),
      ),
    );
    //   },
    // );
  }
}

class _ViewModel {
  final List<Task> taskList;

  _ViewModel(Store<AppState> store) : taskList = store.state.taskList;
}
