import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'realtime_event.dart';
part 'realtime_state.dart';

class RealtimeBloc extends Bloc<RealtimeEvent, RealtimeState> {
  RealtimeBloc() : super(RealtimeInitial()) {
    on<RealtimeEvent>((event, emit) {
      // ignore: todo
      // TODO(username): implement event handler
    });
  }
}
