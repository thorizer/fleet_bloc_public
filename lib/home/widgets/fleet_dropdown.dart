import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/asset/bloc/asset_bloc.dart';
import 'package:ngi_repository/ngi_repository.dart';

class AutocompleteFleetList extends StatelessWidget {
  const AutocompleteFleetList({Key? key}) : super(key: key);

  static String _displayStringForOption(Fleet option) =>
      option.name ?? 'Unnamed';

  @override
  Widget build(BuildContext context) {
    final _fleetOptions = context.select(
      (AssetBloc bloc) => bloc.state.fleets,
    );
    return BlocBuilder<AssetBloc, AssetState>(
      buildWhen: (previous, current) =>
          previous.selectedFleet?.id != current.selectedFleet?.id,
      builder: (context, state) {
        return Autocomplete<Fleet>(
            displayStringForOption: _displayStringForOption,
            initialValue:
                TextEditingValue(text: _fleetOptions.first.name ?? 'Unnamed'),
            optionsMaxHeight: 200,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<Fleet>.empty();
              }
              return _fleetOptions.where((Fleet option) {
                return option
                    .toString()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (Fleet selection) {
              
              context.read<AssetBloc>().add(FleetSelected(selection));
            });
      },
    );
  }
}
