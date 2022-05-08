import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todo_counter_state.dart';

class ActiveTodoCounterCubit extends Cubit<ActiveTodoCountState> {
  final int initialActiveTodoCount;

  ActiveTodoCounterCubit({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));

  void calculateActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
