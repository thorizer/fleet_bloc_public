# gdm_bloc

currently the app just show a list of assets loaded from the start and filtered by fleet name in the left drawer , the assets get updated in realtime from socket.io . everytime a message comes from the socket one asset realtime properties will be updated (the asset itself will not) wheter it's shown on the list or not

nothing much going on lib besides the asset feature (in asset_bloc you'll find _onRealtimeAssetSubscriptionRequested event who's responsible for the lag )

the socket_api is inside the ngi_repository package 

there is multiple void main functions that are hidden from file export ( for testing purposes) 

