import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:godo/core/app_state.dart';
import 'package:godo/src/domain/entities/task.dart';

class UpdateTask extends StatelessWidget {
  const UpdateTask({super.key, required this.taskToBeUpdated});

  final Task taskToBeUpdated;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(store),
      builder: (context, vm) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Task> taskList;

  _ViewModel(Store<AppState> store) : taskList = store.state.taskList;
}
