# gdm_bloc

Currently the app just shows a list of assets loaded from the start and filtered by fleet name in the left drawer, the assets get updated in Realtime from socket.io. every time a message comes from the socket an asset's Realtime properties will be updated whether it's shown on the list or not (the asset itself will not be updated)

nothing much going on lib besides the asset feature (in asset_bloc you'll find _onRealtimeAssetSubscriptionRequested event who's responsible for the lag)

the socket_api is inside the ngi_repository package

there is multiple void main functions that are hidden from file export (for testing purposes)

