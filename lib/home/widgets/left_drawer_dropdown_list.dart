// flutter drawer Widget()
// ignore_for_file: lines_longer_than_80_chars, avoid_print, library_private_types_in_public_api, must_be_immutable

import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gdm_bloc/asset/asset.dart';

class LeftDrawerDropDownList extends StatefulWidget {
  const LeftDrawerDropDownList({Key? key}) : super(key: key);

  @override
  _LeftDrawerDropDownListState createState() => _LeftDrawerDropDownListState();
}

class _LeftDrawerDropDownListState extends State<LeftDrawerDropDownList> {
  /// This is register text field controllers.
  final TextEditingController _fleetTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fleetTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _mainBody();
  }

  /// This is Main Body widget.
  Widget _mainBody() {
    return Builder(
      builder: (context) {
        final fleetsListNames = context.select(
          (AssetBloc bloc) => bloc.state.fleets
              .map((fleet) => fleet.name ?? 'Unnamed')
              .toList(),
        );
        final _listOfFleetsDropDownNames = fleetsListNames.isNotEmpty
            ? fleetsListNames
                .map((fleetName) => SelectedListItem(false, fleetName))
                .toList()
            : <SelectedListItem>[];
        final SelectedFleetName = context.select(
          (AssetBloc bloc) =>
              bloc.state.selectedFleet?.name ?? fleetsListNames[0],
        );
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                textEditingController: TextEditingController(
                  text: SelectedFleetName,
                ),
                title: 'Fleet',
                hint: 'Select a Fleet',
                isFleetSelected: true,
                fleets: _listOfFleetsDropDownNames,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// This is Common App text field class.
class AppTextField extends StatefulWidget {
  AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isFleetSelected,
    this.fleets,
    Key? key,
  }) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  final String title;
  final String hint;
  final bool isFleetSelected;
  final List<SelectedListItem>? fleets;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  /// This is on text changed method which will display on fleet text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: 'kDone',
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: 'Search',
        bottomSheetTitle: 'Fleets',
        searchBackgroundColor: const Color.fromARGB(31, 193, 57, 57),
        dataList: widget.fleets ?? [],
        selectedItems: (List<dynamic> selectedList) {},
        selectedItem: (String selected) {
          print(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5,
        ),

        /*   final fleets = context.select(
            (AssetBloc bloc) => bloc.state.fleets,
          );
         // final fleetState = context.watch<AssetBloc>();

         // final assetState = context.read<AssetBloc>();
*/

        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
