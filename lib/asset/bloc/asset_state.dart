// ignore_for_file: lines_longer_than_80_chars

part of 'asset_bloc.dart';

enum AssetStatus { initial, success, failure, Unauthorized }

enum SocketStatus { initial, success, failure, Unauthorized }

class AssetState extends Equatable {
  const AssetState({
    this.status = AssetStatus.initial,
    this.socketStatus = SocketStatus.initial,
    this.assets = const <Asset>[],
    this.rt = const <String, RtRepo?>{},
    this.fleets = const <Fleet>[],
    this.selectedFleet,
    this.selectedAssets = const <Asset>[],
    this.fleetAssets = const <Asset>[],
  });
  final AssetStatus status;
  final SocketStatus socketStatus;
  final List<Asset> assets;
  final Map<String, RtRepo?> rt;
  final List<Fleet> fleets;
  final Fleet? selectedFleet;
  final List<Asset> selectedAssets;
  final List<Asset> fleetAssets;

  @override
  String toString() =>
      'AssetState(selectedFleet: ${selectedFleet?.name},  status: $status, assets: ${assets.length} rt: ${rt.length} fleets: ${fleets.length} selectedAssets: ${selectedAssets.length} fleetAssets: ${fleetAssets.length})';

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
      rt: rt ?? this.rt,
      fleets: fleets ?? this.fleets,
      selectedFleet: selectedFleet ?? this.selectedFleet,
      selectedAssets: selectedAssets ?? this.selectedAssets,
      fleetAssets: fleetAssets ?? this.fleetAssets,
    );
  }

  @override
  List<Object?> get props => [
        status,
        socketStatus,
        assets,
        rt,
        fleets,
        selectedFleet,
        selectedAssets,
        fleetAssets
      ];
}
