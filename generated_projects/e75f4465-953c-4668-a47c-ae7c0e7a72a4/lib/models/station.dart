class Station {
  final String id;
  final String name;
  final double distanceOffset; // Distance from first station in km
  final bool isInterchange;
  final String landmark;

  const Station({
    required this.id,
    required this.name,
    required this.distanceOffset,
    this.isInterchange = false,
    this.landmark = "Nearby landmark",
  });
}

final List<Station> meerutStations = [
  const Station(id: '1', name: 'Meerut South', distanceOffset: 0.0, landmark: 'Partapur Bypass'),
  const Station(id: '2', name: 'Partapur', distanceOffset: 4.5, landmark: 'Industrial Area'),
  const Station(id: '3', name: 'Rithani', distanceOffset: 7.2, landmark: 'Rithani West'),
  const Station(id: '4', name: 'Shatabdi Nagar', distanceOffset: 10.5, landmark: 'Shatabdi Enclave'),
  const Station(id: '5', name: 'Brahmapuri', distanceOffset: 13.1, landmark: 'Lisari Road'),
  const Station(id: '6', name: 'Meerut Central', distanceOffset: 16.0, isInterchange: true, landmark: 'Railway Station'),
  const Station(id: '7', name: 'Bhaisali', distanceOffset: 18.2, landmark: 'Bus Stand'),
  const Station(id: '8', name: 'Begumpul', distanceOffset: 20.5, landmark: 'Main Market'),
  const Station(id: '9', name: 'MES Colony', distanceOffset: 22.8, landmark: 'Cantonment'),
  const Station(id: '10', name: 'Daurli', distanceOffset: 25.1, landmark: 'Daurli Market'),
  const Station(id: '11', name: 'Meerut North', distanceOffset: 28.3, landmark: 'NH-58'),
  const Station(id: '12', name: 'Modipuram', distanceOffset: 31.0, landmark: 'University Area'),
];
