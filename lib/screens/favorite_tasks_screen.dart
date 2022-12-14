import 'package:flutter/material.dart';

import '../blocs/bloc.exports.dart';
import '../models/task.dart';
import '../test_data.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.favoriteTasks;
      const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${tasksList.length} Tasks',
              ),
            ),
          ),
          const SizedBox(height: 10),
          TasksList(tasksList: tasksList),
        ],
      );
    });
  }
}
