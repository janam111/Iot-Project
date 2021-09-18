class Device {
  final String name, imagePath, unitsConsumed, timetaken;

  Device({
    this.name,
    this.imagePath,
    this.unitsConsumed,
    this.timetaken,
  });
}

// ignore: non_constant_identifier_names
final Devices = [
  Device(
    name: "Automatic Water Heater",
    unitsConsumed: "6 kWh",
    timetaken: "3 hrs",
    imagePath: "assets/waterheater.png",
  ),
  Device(
    name: "Light",
    unitsConsumed: "9 Wh",
    timetaken: "18 hrs",
    imagePath: "assets/light.png",
  ),
  Device(
    name: "Fridge",
    unitsConsumed: "0.6 kWh",
    timetaken: " 24 hrs",
    imagePath: "assets/fridge.png",
    // consumes 2.40 rs per day 876 a year //
  ),
];
