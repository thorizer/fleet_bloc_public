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
    this.assets = const <Asset>[],
    this.realtimeData = const <String, RtRepo?>{},
    this.lastRtGpsDt = null,
    this.fleets = const <Fleet>[],
    this.selectedFleet,
    this.fleetAssets = const <Asset>[],
  });
  /// The current status of the asset bloc
  final AssetStatus status;
  /// The status of the socket connection
  final SocketStatus socketStatus;
  ///  list of all assets
  final List<Asset> assets;
  /// map of assets ids and their realtime data
  final Map<String, RtRepo?> realtimeData;
  /// last realtime gps date
  final String? lastRtGpsDt;
  /// list of fleets
  final List<Fleet> fleets;
  /// the selected fleet
  final Fleet? selectedFleet;
  /// list of assets of the selected fleet
  final List<Asset> fleetAssets;
  @override
  String toString() =>
      'AssetState(selectedFleet: ${selectedFleet?.name}, lastRtGpsDt: $lastRtGpsDt)';
  AssetState copyWith({
    /// The current status of the asset bloc
    AssetStatus? status,
    /// The status of the socket connection
    SocketStatus? socketStatus,
    ///  list of all assets
    List<Asset>? assets,
    /// map of assets ids and their realtime data
    Map<String, RtRepo?>? realtimeData,
    /// last realtime gps date
    String? lastRtGpsDt,
    /// list of fleets
    List<Fleet>? fleets,
    /// the selected fleet
    Fleet? selectedFleet,
    /// list of assets of the selected fleet
    List<Asset>? fleetAssets,
  }) {
    return AssetState(
      status: status ?? this.status,
      socketStatus: socketStatus ?? this.socketStatus,
      assets: assets ?? this.assets,
      realtimeData: realtimeData ?? this.realtimeData,
      lastRtGpsDt: lastRtGpsDt ?? this.lastRtGpsDt,
      fleets: fleets ?? this.fleets,
      selectedFleet: selectedFleet ?? this.selectedFleet,
      fleetAssets: fleetAssets ?? this.fleetAssets,
    );
  }
  @override
  List<Object?> get props => [
        status,
        lastRtGpsDt,
        selectedFleet,
      ];
}
