// flutter drawer Widget()
// ignore_for_file: lines_longer_than_80_chars
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gdm_bloc/asset/asset.dart';
import 'package:ngi_repository/ngi_repository.dart';
class LeftDrawerDropDown0 extends StatelessWidget {
  const LeftDrawerDropDown0({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fleetList = context.select(
      (AssetBloc bloc) => bloc.state.fleets,
    );
    // sort fleetlist
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: fleetList
            .map((item) => DropdownMenuItem<String>(
                  value: item.id,
                  child: Text(
                    item.name ?? 'Unnamed',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        //dropdownItems: fleetList.isNotEmpty ? fleetList.map((fleet) => fleet.name!).toList() : [],
        scrollbarAlwaysShow: true,
        value: context.select(
          (AssetBloc bloc) => bloc.state.fleets.isNotEmpty
              ? bloc.state.selectedFleet!.id
              : null,
        ),
        buttonElevation: 11,
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
        onChanged: (fleetId) {
          context.read<AssetBloc>().add(
                FleetSelected(
                    fleetList.firstWhere((fleet) => fleet.id == fleetId)),
              );
        },
      ),
    );
  }
}
class LeftDrawerDropDown extends StatelessWidget {
  const LeftDrawerDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fleetList = context.select(
      (AssetBloc bloc) => bloc.state.fleets,
    );
    //fleet.sort((a, b) => a.name!.compareTo(b.name!));
    return DropdownButtonHideUnderline(
      child: CustomDropdownButton3(
        hint: 'Select Item',
        dropdownItems: fleetList,
        //dropdownItems: fleetList.isNotEmpty ? fleetList.map((fleet) => fleet.name!).toList() : [],
        scrollbarAlwaysShow: true,
        value: context.select(
          (AssetBloc bloc) => bloc.state.fleets.isNotEmpty
              ? bloc.state.selectedFleet!.id
              : null,
        ),
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
        onChanged: (fleetId) {
          context.read<AssetBloc>().add(
                FleetSelected(
                    fleetList.firstWhere((fleet) => fleet.id == fleetId)),
              );
        },
      ),
    );
  }
}
class CustomDropdownButton3 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<Fleet> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  const CustomDropdownButton3({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item.id,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item.name ?? 'Unnamed',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
        iconSize: iconSize ?? 12,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding:
            buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,
        dropdownWidth: dropdownWidth ?? 140,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}
