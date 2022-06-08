part of 'alert_bloc.dart';

@immutable
abstract class AlertEvent extends Equatable {
  const AlertEvent();

  @override
  List<Object> get props => [];
}

class AlertsLoaded extends AlertEvent {}

class RealtimeAlertAdded extends AlertEvent {
  const RealtimeAlertAdded(this.alert);

  final Alert alert;

  @override
  List<Object> get props => [alert];
}

class RealtimeAlertUpdated extends AlertEvent {
  const RealtimeAlertUpdated(this.alert);

  final Alert alert;

  @override
  List<Object> get props => [alert];
}
