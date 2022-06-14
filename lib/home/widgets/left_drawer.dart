// flutter drawer Widget()
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gdm_bloc/asset/asset.dart';
import 'package:gdm_bloc/home/widgets/widgets.export.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              curve: Curves.easeInCubic,
              child: Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/sidebar/car_fleet_2.png'),
                      radius: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(padding: EdgeInsets.all(8)),
                          LeftDrawerDropDown(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: AssetsListSideBar(),
          ),
        ],
      ),
    );
  }
}

class AssetsListSideBar extends StatelessWidget {
  AssetsListSideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fleetAssets = context.select(
      (AssetBloc bloc) => bloc.state.fleetAssets,
    );

    //print(fleetAssets);
    return ListView.builder(
      key: const PageStorageKey<String>('sidebar'),
      primary: false,
      itemCount: fleetAssets.length,
      itemExtent: 100,
      //shrinkWrap: false,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Builder(builder: (context) {
          final assetFromList = fleetAssets[index];

          final rtFromList = context.select(
            (AssetBloc bloc) => bloc.state.realtimeData[assetFromList.id],
          );
          final isAftertime = DateTime.now()
              .subtract(const Duration(seconds: 30))
              .isAfter(DateTime.parse(
                  rtFromList?.gps_dt ?? '2021-01-01T00:00:00.000Z'));

          return SizedBox(
            height: 100,
            child: Card(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        'assets/images/fleet/${assetFromList.type!.name}/${rtFromList?.status}_3d.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          child: Text(assetFromList.name ?? 'Unnamed'),
                        ),
                        Flexible(
                          child: Text(
                              DateTime.parse(rtFromList?.gps_dt ??
                                      '2021-01-01T00:00:00.000Z')
                                  .toLocal()
                                  .toString(),
                              style: isAftertime
                                  ? TextStyle(fontSize: 16, color: Colors.red)
                                  : TextStyle(
                                      fontSize: 16, color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class AssetRtInfo extends StatelessWidget {
  const AssetRtInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    print(index);
    final assetName = context.select(
      (AssetBloc bloc) => bloc.state.fleetAssets[index].name ?? 'Unnamed',
    );
    //final assetNameR = assetName ?? 'Unnamed';
    return Text(assetName);
  }
}

class AssetRtImage extends StatelessWidget {
  const AssetRtImage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final assetType = context.select(
      (AssetBloc bloc) => bloc.state.fleetAssets[index].type?.name ?? 'Truck',
    );
    final assetId = context.select(
      (AssetBloc bloc) => bloc.state.fleetAssets[index].id,
    );
    final assetsRealtimeStatus = context.select(
      (AssetBloc bloc) =>
          bloc.state.realtimeData[assetId]?.status ?? 'disabled',
    );
    //final assetTypeR = assetType ?? 'Truck';
    //final assetsRealtimeMapStatusR = assetsRealtimeStatus ?? 'disabled';
    return Image.asset(
      'assets/images/fleet/${assetType}/${assetsRealtimeStatus}_3d.png',
    );
  }
}
