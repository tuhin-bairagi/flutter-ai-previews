import 'package:flutter/material.dart';
import 'package:meerut_metro/models/station.dart';
import 'package:meerut_metro/widgets/route_summary.dart';
import 'package:meerut_metro/widgets/station_picker.dart';
import 'package:meerut_metro/widgets/route_step.dart';

class MetroNavigatorHome extends StatefulWidget {
  const MetroNavigatorHome({super.key});

  @override
  State<MetroNavigatorHome> createState() => _MetroNavigatorHomeState();
}

class _MetroNavigatorHomeState extends State<MetroNavigatorHome> {
  Station? _source = meerutStations.first;
  Station? _destination = meerutStations.last;

  void _swapStations() {
    setState(() {
      final temp = _source;
      _source = _destination;
      _destination = temp;
    });
  }

  Map<String, dynamic> _calculateRoute() {
    if (_source == null || _destination == null) return {};
    
    int startIndex = meerutStations.indexOf(_source!);
    int endIndex = meerutStations.indexOf(_destination!);
    
    bool isReverse = startIndex > endIndex;
    List<Station> route = isReverse 
        ? meerutStations.sublist(endIndex, startIndex + 1).reversed.toList()
        : meerutStations.sublist(startIndex, endIndex + 1);

    double distance = (meerutStations[startIndex].distanceOffset - meerutStations[endIndex].distanceOffset).abs();
    int time = (distance * 2.5).toInt() + (route.length * 1); 
    int fare = 15 + (distance * 2.5).toInt(); 
    fare = (fare / 5).round() * 5;
    if (fare < 20) fare = 20;
    if (fare > 80) fare = 80;

    return {
      'route': route,
      'distance': distance.toStringAsFixed(1),
      'time': time,
      'fare': fare,
      'stops': (startIndex - endIndex).abs(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeData = _calculateRoute();
    final List<Station> routeList = routeData['route'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.train_rounded),
            SizedBox(width: 8),
            Text('Meerut Metro'),
          ],
        ),
      ),
      body: Column(
        children: [
          StationPicker(
            source: _source,
            destination: _destination,
            onSourceChanged: (s) => setState(() => _source = s),
            onDestinationChanged: (s) => setState(() => _destination = s),
            onSwap: _swapStations,
          ),
          RouteSummary(data: routeData),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: routeList.length,
              itemBuilder: (context, index) {
                return RouteStep( 
                  station: routeList[index], 
                  isFirst: index == 0, 
                  isLast: index == routeList.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
