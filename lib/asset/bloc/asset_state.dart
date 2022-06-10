// ignore_for_file: lines_longer_than_80_chars

part of 'asset_bloc.dart';

enum AssetStatus { initial, success, failure, Unauthorized }

enum SocketStatus { initial, success, failure, Unauthorized }

/// {@template ngi_api}
/// The state of assets with their realtimeData .
/// {@endtemplate}
class AssetState extends Equatable {
  const AssetState({
    this.status = AssetStatus.initial,
    this.socketStatus = SocketStatus.initial,
    this.realtimeData = const <String, RtRepo?>{},
    this.fleets = const <Fleet>[],
    this.assets = const <Asset>[],
    this.fleetAssets = const <Asset>[],
    this.selectedFleet,
  });

  /// The current status of the asset bloc
  final AssetStatus status;

  /// The status of the socket connection
  final SocketStatus socketStatus;

  ///  list of all assets
  final List<Asset> assets;

  /// map of assets ids and their realtime data
  final Map<String, RtRepo?> realtimeData;

  /// list of fleets
  final List<Fleet> fleets;

  /// the selected fleet
  final Fleet? selectedFleet;

  /// list of assets of the selected fleet
  final List<Asset> fleetAssets;

  @override
  String toString() =>
      'AssetState(selectedFleet: ${selectedFleet?.name},  status: $status, assets: ${assets.length} rt: ${realtimeData.length} fleets: ${fleets.length}';

  AssetState copyWith({
    AssetStatus? status,
    SocketStatus? socketStatus,
    List<Asset>? assets,
    Map<String, RtRepo?>? rt,
    List<Fleet>? fleets,
    Fleet? selectedFleet,
    List<Asset>? selectedAssets,
    List<Asset>? fleetAssets,
  }) {
    return AssetState(
      status: status ?? this.status,
      socketStatus: socketStatus ?? this.socketStatus,
      assets: assets ?? this.assets,
      realtimeData: rt ?? this.realtimeData,
      fleets: fleets ?? this.fleets,
      selectedFleet: selectedFleet ?? this.selectedFleet,
      fleetAssets: fleetAssets ?? this.fleetAssets,
    );
  }

  @override
  List<Object?> get props => [
        status,
        socketStatus,
        assets,
        realtimeData,
        fleets,
        selectedFleet,
        fleetAssets
      ];
}
