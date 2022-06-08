// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetQuery _$AssetQueryFromJson(Map<String, dynamic> json) => AssetQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((dynamic e) => Asset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$AssetQueryToJson(AssetQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'page_count': instance.page_count,
      'total_count': instance.total_count,
    };

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      alerts: json['alerts'] as List<dynamic>?,
      attributes: json['attributes'] == null
          ? null
          : AssetAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>,),
      brand: json['brand'] as String?,
      codeProduct: json['codeProduct'] as String?,
      company_owner: json['_company_owner'] as String?,
      createdBy: json['createdBy'] as String?,
      creation_dt: json['creation_dt'] as String?,
      Detailtype:
          $enumDecodeNullable(_$AssetDetailtypeEnumMap, json['Detailtype']),
      dev: json['_dev'] as String?,
      disabled: json['disabled'] as bool?,
      fuel: $enumDecodeNullable(_$FuelTypeEnumMap, json['fuel']),
      id: json['_id'] as String,
      idCard: (json['idCard'] as num?)?.toDouble(),
      meterType: $enumDecodeNullable(_$MeterTypeEnumMap, json['meterType']),
      model: json['model'] as String?,
      modif_dt: json['modif_dt'] as String?,
      name: json['name'] as String?,
      notMonitor: json['notMonitor'] as bool?,
      product_total: json['product_total'] as String?,
      rt: json['rt'] == null
          ? null
          : Rt.fromJson(json['rt'] as Map<String, dynamic>),
      sensors: (json['sensors'] as List<dynamic>?)
          ?.map((dynamic e) => Sensor.fromJson(e as Map<String, dynamic>))
          .toList(),
      stial_daily_odo: (json['stial_daily_odo'] as num?)?.toDouble(),
      stial_name: json['stial_name'] as String?,
      stial_odo_dt: json['stial_odo_dt'] as String?,
      stial_odo: (json['stial_odo'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$AssetTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'Detailtype': _$AssetDetailtypeEnumMap[instance.Detailtype],
      'type': _$AssetTypeEnumMap[instance.type],
      'attributes': instance.attributes?.toJson(),
      'disabled': instance.disabled,
      'notMonitor': instance.notMonitor,
      'idCard': instance.idCard,
      'stial_daily_odo': instance.stial_daily_odo,
      'stial_odo': instance.stial_odo,
      'fuel': _$FuelTypeEnumMap[instance.fuel],
      'alerts': instance.alerts,
      'sensors': instance.sensors?.map((e) => e.toJson()).toList(),
      'meterType': _$MeterTypeEnumMap[instance.meterType],
      'rt': instance.rt?.toJson(),
      '_id': instance.id,
      'brand': instance.brand,
      'codeProduct': instance.codeProduct,
      '_company_owner': instance.company_owner,
      'createdBy': instance.createdBy,
      'creation_dt': instance.creation_dt,
      '_dev': instance.dev,
      'model': instance.model,
      'modif_dt': instance.modif_dt,
      'name': instance.name,
      'product_total': instance.product_total,
      'stial_name': instance.stial_name,
      'stial_odo_dt': instance.stial_odo_dt,
    };

const _$AssetDetailtypeEnumMap = {
  AssetDetailtype.bigtruck: 'bigtruck',
  AssetDetailtype.building: 'building',
  AssetDetailtype.bus: 'bus',
  AssetDetailtype.commercialVehicle: 'commercial vehicle',
  AssetDetailtype.lightVehicle: 'light vehicle',
  AssetDetailtype.lighttruck: 'lighttruck',
  AssetDetailtype.lou: 'LOU',
  AssetDetailtype.personalVehicle: 'personal vehicle',
  AssetDetailtype.pickup: 'pickup',
  AssetDetailtype.remorqueFrigo: 'remorque_frigo',
  AssetDetailtype.truck: 'truck',
  AssetDetailtype.warehouse: 'warehouse',
};

const _$FuelTypeEnumMap = {
  FuelType.diesel: 'diesel',
  FuelType.electric: 'electric',
  FuelType.gas: 'gas',
  FuelType.gasoline: 'gasoline',
};

const _$MeterTypeEnumMap = {
  MeterType.hour: 'hour',
  MeterType.km: 'km',
};

const _$AssetTypeEnumMap = {
  AssetType.bus: 'BUS',
  AssetType.commercialVehicle: 'COMMERCIAL_VEHICLE',
  AssetType.concreteMixer: 'CONCRETE_MIXER',
  AssetType.containerTruck: 'CONTAINER_TRUCK',
  AssetType.container: 'CONTAINER',
  AssetType.dumpTruck: 'DUMP_TRUCK',
  AssetType.fuelTankTruck: 'FUEL_TANK_TRUCK',
  AssetType.lightTruck: 'LIGHT_TRUCK',
  AssetType.motorcycle: 'MOTORCYCLE',
  AssetType.personalVehicle: 'PERSONAL_VEHICLE',
  AssetType.refrigeratedTruck: 'REFRIGERATED_TRUCK',
  AssetType.trailerTruck: 'TRAILER_TRUCK',
  AssetType.truck: 'TRUCK',
  AssetType.utilityTruck: 'UTILITY_TRUCK',
  AssetType.warehouse: 'WAREHOUSE',
};

Sensor _$SensorFromJson(Map<String, dynamic> json) => Sensor(
      disableFuelInStop: json['disableFuelInStop'] as bool?,
      enableFuelInStop: json['enableFuelInStop'] as bool?,
      enableFuncPolynomial: json['enableFuncPolynomial'] as bool?,
      family: $enumDecodeNullable(_$SensorFamilyEnumMap, json['family']),
      id: json['_id'] as String?,
      isAbsolute: json['isAbsolute'] as bool?,
      max: json['max'] as num?,
      maxSrc: json['maxSrc'] as num?,
      min: json['min'] as num?,
      minSrc: json['minSrc'] as num?,
      name: json['name'] as String?,
      off: json['off'] as int?,
      on: json['on'] as int?,
      refuelingConfig: json['refuelingConfig'] as bool?,
      src: json['src'] as String?,
      type: $enumDecodeNullable(_$SensorTypeEnumMap, json['type']),
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']),
      visible: json['visible'] as bool?,
    );

Map<String, dynamic> _$SensorToJson(Sensor instance) => <String, dynamic>{
      'disableFuelInStop': instance.disableFuelInStop,
      'enableFuelInStop': instance.enableFuelInStop,
      'enableFuncPolynomial': instance.enableFuncPolynomial,
      'isAbsolute': instance.isAbsolute,
      'refuelingConfig': instance.refuelingConfig,
      'visible': instance.visible,
      'off': instance.off,
      'on': instance.on,
      'max': instance.max,
      'maxSrc': instance.maxSrc,
      'min': instance.min,
      'minSrc': instance.minSrc,
      'family': _$SensorFamilyEnumMap[instance.family],
      'type': _$SensorTypeEnumMap[instance.type],
      '_id': instance.id,
      'name': instance.name,
      'src': instance.src,
      'unit': _$UnitEnumMap[instance.unit],
    };

const _$SensorFamilyEnumMap = {
  SensorFamily.analogic: 'ANALOGIC',
  SensorFamily.binary: 'BINARY',
};

const _$SensorTypeEnumMap = {
  SensorType.cabineStatus: 'CABINE_STATUS',
  SensorType.doorStatus: 'DOOR_STATUS',
  SensorType.engineTemp: 'ENGINE_TEMP',
  SensorType.fuelLevel: 'FUEL_LEVEL',
  SensorType.fuelUsed: 'FUEL_USED',
  SensorType.gas: 'GAS',
  SensorType.humidity: 'HUMIDITY',
  SensorType.missionStatus: 'MISSION_STATUS',
  SensorType.odometer: 'ODOMETER',
  SensorType.oilStatus: 'OIL_STATUS',
  SensorType.pressure: 'PRESSURE',
  SensorType.refrigerationStatus: 'REFRIGERATION_STATUS',
  SensorType.rpm: 'RPM',
  SensorType.spinningStatus: 'SPINNING_STATUS',
  SensorType.taxiStatus: 'TAXI_STATUS',
  SensorType.temperature: 'TEMPERATURE',
};

const _$UnitEnumMap = {
  Unit.km: 'Km',
  Unit.L: 'L',
  Unit.rpm: 'Rpm',
  Unit.C: '°C',
  Unit.empty: ' ',
  Unit.V: 'V',
  Unit.kmH: 'Km/h',
  Unit.unit: 'UNIT',
  Unit.kg: 'Kg',
  Unit.percent: '%',
};

AssetAttributes _$AssetAttributesFromJson(Map<String, dynamic> json) =>
    AssetAttributes(
      category: json['category'] as String?,
      zone: json['zone'] as String?,
    );

Map<String, dynamic> _$AssetAttributesToJson(AssetAttributes instance) =>
    <String, dynamic>{
      'category': instance.category,
      'zone': instance.zone,
    };

Loc _$LocFromJson(Map<String, dynamic> json) => Loc(
      coordinates_dt: json['coordinates_dt'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)?.map((dynamic e) {
        if (e is String) {
          return double.parse(e);
        } else if (e is num) {
          return e.toDouble();
        }
        return e as double;
      }).toList(),
      type_dt: json['type_dt'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LocToJson(Loc instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
      'coordinates_dt': instance.coordinates_dt,
      'type_dt': instance.type_dt,
      'type': instance.type,
    };

Rt _$RtFromJson(Map<String, dynamic> json) => Rt(
      CANBUSDATA_dt: json['CANBUSDATA_dt'] as String?,
      CANBUSDATA: json['CANBUSDATA'] as Map<String, dynamic>?,
      consL_Km: json['consL_Km'] as String?,
      gps_dt: json['gps_dt'] as String?,
      io_dt: json['io_dt'] as String?,
      io: json['io'] as Map<String, dynamic>?,
      last_stop_dt: json['last_stop_dt'] as String?,
      loc_dt: json['loc_dt'] as String?,
      loc: json['loc'] == null
          ? null
          : Loc.fromJson(json['loc'] as Map<String, dynamic>),
      odo: (json['odo'] as num?)?.toDouble(),
      srv_dt: json['srv_dt'] as String?,
      uid_dt: json['uid_dt']?.toString(),
      uid: json['uid']?.toString(),
      working_time: json['working_time'] as num?,
    );

Map<String, dynamic> _$RtToJson(Rt instance) => <String, dynamic>{
      'odo': instance.odo,
      'loc': instance.loc?.toJson(),
      'CANBUSDATA': instance.CANBUSDATA,
      'io': instance.io,
      'working_time': instance.working_time,
      'CANBUSDATA_dt': instance.CANBUSDATA_dt,
      'consL_Km': instance.consL_Km,
      'gps_dt': instance.gps_dt,
      'io_dt': instance.io_dt,
      'last_stop_dt': instance.last_stop_dt,
      'loc_dt': instance.loc_dt,
      'srv_dt': instance.srv_dt,
      'uid_dt': instance.uid_dt,
      'uid': instance.uid,
    };
