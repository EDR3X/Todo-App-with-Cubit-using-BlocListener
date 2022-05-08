import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listener/cubits/cubits.dart';

import '../../models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Todo',
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            context
                .read<ActiveTodoCounterCubit>()
                .calculateActiveTodoCount(activeTodoCount);
          },
          child: BlocBuilder<ActiveTodoCounterCubit, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} items left',
                style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
              );
            },
          ),
        ),
        // Text(
        //     "${context.watch<ActiveTodoCounterCubit>().state.activeTodoCount} items left")
      ],
    );
  }
}
