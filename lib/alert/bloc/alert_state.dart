part of 'alert_bloc.dart';

enum AlertStatus { initial, success, failure }


class AlertState extends Equatable {
  const AlertState({
    this.status = AlertStatus.initial,
    this.alerts = const <Alert>[],
  });
  final AlertStatus status;
  final List<Alert> alerts;


  @override
  String toString() => 'AlertState(status: $status, assets: ${alerts.length})';

  AlertState copyWith({
    AlertStatus? status,
    List<Alert>? alerts,
  }) {
    return AlertState(
      status: status ?? this.status,
      alerts: alerts ?? this.alerts,
    );
  }
  
  @override
  List<Object> get props => [status, alerts];
}
