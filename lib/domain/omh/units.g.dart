// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitValue _$UnitValueFromJson(Map<String, dynamic> json) {
  return UnitValue(json['unit'] as String, (json['value'] as num)?.toDouble());
}

Map<String, dynamic> _$UnitValueToJson(UnitValue instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', instance.unit);
  writeNotNull('value', instance.value);
  return val;
}

LengthUnitValue _$LengthUnitValueFromJson(Map<String, dynamic> json) {
  return LengthUnitValue(json['unit'] as String, json['value']);
}

Map<String, dynamic> _$LengthUnitValueToJson(LengthUnitValue instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', instance.unit);
  writeNotNull('value', instance.value);
  return val;
}

LengthUnit _$LengthUnitFromJson(Map<String, dynamic> json) {
  return LengthUnit(json['schema_value'] as String);
}

Map<String, dynamic> _$LengthUnitToJson(LengthUnit instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schema_value', instance.schemaValue);
  return val;
}