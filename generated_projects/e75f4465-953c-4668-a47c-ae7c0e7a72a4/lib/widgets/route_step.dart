import 'package:flutter/material.dart';
import 'package:meerut_metro/models/station.dart';
import 'package:meerut_metro/screens/station_details_screen.dart';

class RouteStep extends StatelessWidget {
  final Station station;
  final bool isFirst;
  final bool isLast;

  const RouteStep({super.key, required this.station, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StationDetailsScreen(station: station)),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(width: 3, height: 25, color: isFirst ? Colors.transparent : color),
              Container(
                width: 18, height: 18,
                decoration: BoxDecoration(
                  color: isFirst || isLast ? color : Colors.white,
                  border: Border.all(color: color, width: 3),
                  shape: BoxShape.circle
                ),
              ),
              Container(width: 3, height: 25, color: isLast ? Colors.transparent : color),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          station.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isFirst || isLast ? FontWeight.bold : FontWeight.w500,
                            color: isFirst || isLast ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ),
                      const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                    ],
                  ),
                  if (isFirst) const Text("Start Station", style: TextStyle(fontSize: 11, color: Colors.blue, fontWeight: FontWeight.bold)),
                  if (isLast) const Text("Destination", style: TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
                  if (!isFirst && !isLast) Text(station.landmark, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
