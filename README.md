# Open mHealth Schemas for Flutter

A Flutter implementation of the [Open mHealth](https://www.openmhealth.org) [schemas](https://www.openmhealth.org/documentation/#/schema-docs/schema-library).
The original Java schemas are available on the Open mHealth [GitHub](https://github.com/openmhealth/schemas). 

__Disclaimer__: Note that not all OMH schemas are implemented yet. This is work in progress. 

## Usage

To use this plugin, add `openmhealth_schemas` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Example

The following example shows how to use the OMH Flutter classes  to model OMH measures, convert these to JSON, and read them back from JSON. 

### Creating OMH Measures as Dart Objects

First, create an OMH `BloodPressure` measure similar to the [OMH BloodPressure example](https://www.openmhealth.org/documentation/#/schema-docs/schema-library/schemas/omh_blood-pressure).

```dart
  BloodPressure bp = BloodPressure(
      systolicBloodPressure: SystolicBloodPressure(
          unit: BloodPressureUnit.MM_OF_MERCURY, value: 160.0),
      diastolicBloodPressure: DiastolicBloodPressure(
          unit: BloodPressureUnit.MM_OF_MERCURY, value: 80.0),
      positionDuringMeasurement: PositionDuringMeasurement.SITTING);

  DateTime start = new DateTime(2016, 2, 5);
  DateTime end = new DateTime(2016, 6, 5);
  TimeInterval time = new TimeInterval(startDateTime: start, endDateTime: end);
  bp.effectiveTimeFrame = new TimeFrame(timeInterval: time);
  bp.descriptiveStatistic = DescriptiveStatistic.MAXIMUM;
```

This can now be converted to JSON.

```dart
  final bp_json = JsonEncoder.withIndent(' ').convert(bp);
```

which should produce the following JSON

```json
{
 "effective_time_frame": {
  "time_interval": {
   "start_date_time": "2016-02-05T00:00:00.000",
   "end_date_time": "2016-06-05T00:00:00.000"
  }
 },
 "descriptive_statistic": "maximum",
 "systolic_blood_pressure": {
  "unit": "mmHg",
  "value": 160.0
 },
 "diastolic_blood_pressure": {
  "unit": "mmHg",
  "value": 60.0
 },
 "position_during_measurement": "sitting"
}
```  

Similarly, a OMH `Geoposition` similar to the [OMH Geoposition example](https://www.openmhealth.org/documentation/#/schema-docs/schema-library/schemas/omh_geoposition) can be created

```dart
  Geoposition position = Geoposition(
      longitude: PlaneAngleUnitValue(
          unit: PlaneAngleUnit.DEGREE_OF_ARC, value: 40.059692382),
      latitude: PlaneAngleUnitValue(
          unit: PlaneAngleUnit.DEGREE_OF_ARC, value: -105.21440124511719),
      elevation: LengthUnitValue((LengthUnit.METER), 1548.5));

  position.positioningSystem = PositioningSystem.GPS;
  position.effectiveTimeFrame = new TimeFrame(dateTime: DateTime.now());
``` 

This should give the following JSON OMH measure.

```json
{
 "effective_time_frame": {
  "date_time": "2018-08-24T11:08:33.772301"
 },
 "latitude": {
  "unit": "deg",
  "value": 40.059692382
 },
 "longitude": {
  "unit": "deg",
  "value": -105.21440124511719
 },
 "elevation": {
  "unit": "m",
  "value": 1548.5
 },
 "positioning_system": "GPS"
}
```

### Reading OMH JSON Schemas

If you have a OMH JSON measure (in this case a `PhysicalActivity`) you can instantiate a Dart object from it by;

```dart
  final activity = PhysicalActivity.fromJson(json.decode(json_activity_string) as Map<String, dynamic>);
```

### Creating and Uploading OMH Data Points

An OMH `DataPoint` for the above `BloodPressure` measure can be created by;

```dart
  DataPoint dp = new DataPoint(body: bp);
```

which can be converted (using `JsonEncoder.withIndent(' ').convert(dp)`) into the following OMH JSON data point with its header and body.

```json
{
 "header": {
  "id": "747cf980-9620-11e8-afe9-9bf5923b2a8c",
  "creation_date_time": "2018-08-24T11:31:18.681644",
  "schema_id": {
   "namespace": "omh",
   "name": "blood-pressure",
   "version": "1.0"
  }
 },
 "body": {
  "effective_time_frame": {
   "time_interval": {
    "start_date_time": "2016-02-05T00:00:00.000",
    "end_date_time": "2016-06-05T00:00:00.000"
   }
  },
  "descriptive_statistic": "maximum",
  "systolic_blood_pressure": {
   "unit": "mmHg",
   "value": 160.0
  },
  "diastolic_blood_pressure": {
   "unit": "mmHg",
   "value": 60.0
  },
  "position_during_measurement": "sitting"
 }
}
```

## Uploading to OMH Data Storage Unit

Uploading to a OMH Data Storage Unit (DSU) (like the [omh-dsu-ri](https://github.com/openmhealth/omh-dsu-ri)) is not implemented yet.


## Getting Started with Flutter

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).

 
## Features and bugs

Please file feature requests and bug reports at the [issue tracker][tracker].

[tracker]: https://github.com/cph-cachet/openmhealth_schemas/issues

## License

This software is copyright (c) 2018-2021 [Copenhagen Center for Health Technology (CACHET)](https://www.cachet.dk/) at the [Technical University of Denmark (DTU)](https://www.dtu.dk).
This software is made available 'as-is' in a MIT [license](/LICENSE).


