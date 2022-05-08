import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listener/cubits/cubits.dart';
import 'package:todo_cubit_listener/pages/todo_page/todo_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCounterCubit>(
          create: (context) => ActiveTodoCounterCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo App",
        theme: ThemeData(primarySwatch: Colors.green),
        home: const TodoPage(),
      ),
    );
  }
}
