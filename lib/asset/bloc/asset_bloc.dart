// ignore_for_file: lines_longer_than_80_chars, avoid_print
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ngi_repository/ngi_repository.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  AssetBloc({
    required AssetRepository assetRepository,
  })  : _assetRepository = assetRepository,
        super(const AssetState()) {
    on<RealtimeAssetsLoaded>(_onRealtimeAssetsLoaded);
    on<FleetSelected>(_onFleetSelected);
    on<RealtimeAssetSubscriptionRequested>(
      _onRealtimeAssetSubscriptionRequested,
    );
  }
  final AssetRepository _assetRepository;

  Future<void> _onRealtimeAssetsLoaded(
    RealtimeAssetsLoaded event,
    Emitter<AssetState> emit,
  ) async {
    if (state.fleets.isEmpty || state.assets.isEmpty) {
      final fleets = await _assetRepository.getAllFleetsQuerry();
      final assets =
          await _assetRepository.getAllAssetsQuerry(fleetList: fleets);
      final fleetAssets = assets.item1
          .where((asset) => asset.fleet!.contains(fleets.first.id))
          .toList();
      emit(
        state.copyWith(
          assets: assets.item1,
          rt: assets.item2,
          fleets: fleets,
          fleetAssets: fleetAssets,
          selectedFleet: fleets.first,
          selectedAssets: fleetAssets,
          status: AssetStatus.success,
        ),
      );
    }
    print(state);
  }

  Future<void> _onFleetSelected(
    FleetSelected event,
    Emitter<AssetState> emit,
  ) async {
    if (state.fleets.isNotEmpty || state.assets.isNotEmpty) {
      final fleetAssets = state.assets
          .where((asset) => asset.fleet!.contains(event.fleet.id))
          .toList();
      emit(
        state.copyWith(
          selectedFleet: event.fleet,
          fleetAssets: fleetAssets,
          selectedAssets: fleetAssets,
        ),
      );
      print('${fleetAssets.length} assets of fleet ${event.fleet.name}');
    }
  }

  Future<void> _onRealtimeAssetSubscriptionRequested(
    RealtimeAssetSubscriptionRequested event,
    Emitter<AssetState> emit,
  ) async {
    await SocketApi.init();

    //no performance issue
    /*SocketApi.getAsset().listen(
      (Asset data) {
        print('Asset.1: ${data.name}');
      },
      cancelOnError: false,
      onError: print,
      onDone: () {
        print('*** asset.1 stream controller Done ***');
      },
    );*/

    // performance issue
    await emit.forEach<Asset>(
      SocketApi.getAsset(),
      onData: (asset) {
        print('${asset.name}');
        return state.copyWith(socketStatus: SocketStatus.success, rt: {
          ...state.rt,
          asset.id: RtRepo(
            CANBUSDATA: asset.rt?.CANBUSDATA,
            CANBUSDATA_dt: asset.rt?.CANBUSDATA_dt,
            consL_Km: asset.rt?.consL_Km,
            gps_dt: asset.rt?.gps_dt,
            io_dt: asset.rt?.io_dt,
            last_stop_dt: asset.rt?.last_stop_dt,
            loc_dt: asset.rt?.loc_dt,
            odo: asset.rt?.odo,
            srv_dt: asset.rt?.srv_dt,
            uid: asset.rt?.uid,
            uid_dt: asset.rt?.uid_dt,
            working_time: asset.rt?.working_time,
            loc: asset.rt?.loc,
            io: asset.rt?.io,
            status: const RtRepo().getStatut(asset.rt?.io),
          ),
        });
      },
      onError: (_, __) => state.copyWith(
        socketStatus: SocketStatus.failure,
      ),
    );
  }
}
