# gdm_bloc
Currently my app shows a list of assets loaded at the start, 
the assets are updated in Realtime from socket.io. 


every time a message comes from the socket, an asset's Realtime properties will be updated.
(The assets list will remain constant after the first load)

In desktop and browser, there is no lag or performance issue. Meanwhile on mobile, I can't even open the drawer. The app is not usable even if I remove all widgets from the tree.
My app currently reaches 1 fps on mobile while the stream is on, and very smooth when it's off. The frequency of updates could reach 10 assets per second. 
I don't have any widgets that rebuild unnecessarily, the UI thread is not the issue


The state in my block looks like the code below, the map contains the asset Id and it's corresponding Realtime data

    final List<Asset> assets;
    final Map<String, Rt?> realtimeData;
the event which subscribes to the stream looks like this:

    Future<void> _onRealtimeAssetSubscriptionRequested(
        RealtimeAssetSubscriptionRequested event,
        Emitter<AssetState> emit,
      ) async {
        await SocketApi.init();
        await emit.forEach<Asset>(
          SocketApi.getAsset(),
          onData: (asset) {
            return state.copyWith(socketStatus: SocketStatus.success, 
             realtimeData: {
              ...state.realtimeData,
              asset.id: RtRepo(
                consL_Km: asset.realtimeData?.consL_Km,
                gps_dt: asset.realtimeData?.gps_dt,
                io_dt: asset.realtimeData?.io_dt,
                last_stop_dt: asset.realtimeData?.last_stop_dt,
                odo: asset.realtimeData?.odo,
                working_time: asset.realtimeData?.working_time,
                loc: asset.realtimeData?.loc,
                loc_dt: asset.realtimeData?.loc_dt,
                io: asset.realtimeData?.io,
              ),
            });
          },
          onError: (_, __) => state.copyWith(
            socketStatus: SocketStatus.failure,
          ),
        );
      }

nothing much going on lib besides the asset feature (in asset_bloc you'll find _onRealtimeAssetSubscriptionRequested event who's responsible for the lag)

the socket_api is inside the ngi_repository package

Returning realtimeData map every time a state changes with socket.io is not very optimal.
Without state management? I would just do this `realtimeData[asset.id] = asset.realtimeData;`

**Could this be a limitation of state.copyWith when used with non-primitive values?**






