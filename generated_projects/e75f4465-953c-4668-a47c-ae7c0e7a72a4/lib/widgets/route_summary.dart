import 'package:flutter/material.dart';

class RouteSummary extends StatelessWidget {
  final Map<String, dynamic> data;

  const RouteSummary({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Metric(icon: Icons.access_time_filled, value: "${data['time']} min", label: "TIME"),
          _VerticalDivider(),
          _Metric(icon: Icons.payments, value: "₹ ${data['fare']}", label: "FARE"),
          _VerticalDivider(),
          _Metric(icon: Icons.route, value: "${data['distance']} km", label: "DIST"),
          _VerticalDivider(),
          _Metric(icon: Icons.layers, value: "${data['stops']} stops", label: "STOPS"),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _Metric({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).primaryColor),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600], letterSpacing: 1.1)),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 30, width: 1, color: Colors.grey[300]);
  }
}
