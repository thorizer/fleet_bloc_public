import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ngi_repository/ngi_repository.dart';

part 'alert_event.dart';
part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  AlertBloc() : super(const AlertState()) {
    on<AlertEvent>((event, emit) {
      // TODOs(Amine): implement event handler
    });
  }
}
