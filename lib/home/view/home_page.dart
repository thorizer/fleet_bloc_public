// ignore_for_file: lines_longer_than_80_chars, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/asset/asset.dart';
import 'package:gdm_bloc/home/widgets/widgets.export.dart';
import 'package:ngi_repository/ngi_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.assetRepository}) : super(key: key);
  final AssetRepository assetRepository;
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => HomePage(assetRepository: AssetRepository()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return RepositoryProvider.value(
      value: assetRepository,
      child: BlocProvider(
        create: (BuildContext context) => AssetBloc(
          assetRepository: assetRepository,
        )
          ..add(RealtimeAssetsLoaded())
          ..add(RealtimeAssetSubscriptionRequested()),
        lazy: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('NGI Fleet'),
          ),
          drawer: const LeftDrawer(),
          endDrawer: const RightDrawer(),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 16, 94, 173),
                    Color.fromARGB(255, 46, 155, 195)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
