part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent extends Equatable {
  const AssetEvent();

  @override
  List<Object> get props => [];
}

class AssetsLoaded extends AssetEvent {}

class FleetSelected extends AssetEvent {
  const FleetSelected(this.fleet);
  final Fleet fleet;

  @override
  List<Object> get props => [fleet];
}

class RealtimeAssetsLoaded extends AssetEvent {}

class RealtimeAssetSubscriptionRequested extends AssetEvent {
  const RealtimeAssetSubscriptionRequested();
}
