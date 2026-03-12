import 'package:flutter/material.dart';
import 'package:meerut_metro/models/station.dart';

class MetroMapScreen extends StatelessWidget {
  const MetroMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Map')),
      body: InteractiveViewer(
        maxScale: 5.0,
        minScale: 0.5,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Meerut Metro (Phase 1)", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: Column(
                    children: [
                      const ConnectionLine(label: "Modipuram Depo", isTop: true),
                      ...meerutStations.map((station) => _MapStationNode(station: station)).toList(),
                      const ConnectionLine(label: "Meerut South Terminus", isBottom: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MapStationNode extends StatelessWidget {
  final Station station;
  const _MapStationNode({required this.station});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80, 
          alignment: Alignment.centerRight,
          child: Text(station.id, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(width: 4, height: 20, color: Colors.blue[900]),
            Container(
              width: 20, height: 20, 
              decoration: BoxDecoration(
                color: station.isInterchange ? Colors.orange : Colors.blue[900],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Container(width: 4, height: 20, color: Colors.blue[900]),
          ],
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 150,
          child: Text(
            station.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class ConnectionLine extends StatelessWidget {
  final String label;
  final bool isTop;
  final bool isBottom;
  const ConnectionLine({super.key, required this.label, this.isTop = false, this.isBottom = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isTop) Container(width: 4, height: 30, color: Colors.grey[300]),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 10, fontStyle: FontStyle.italic)),
        if (isBottom) Container(width: 4, height: 30, color: Colors.grey[300]),
      ],
    );
  }
}
