import 'package:flutter/material.dart';
import 'package:meerut_metro/models/station.dart';

class StationDetailsScreen extends StatelessWidget {
  final Station station;

  const StationDetailsScreen({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(station.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerSection(context, color),
            const SizedBox(height: 24),
            _sectionTitle("Facilities"),
            _facilityGrid(),
            const SizedBox(height: 24),
            _sectionTitle("Nearby Landmarks"),
            Card(
              elevation: 0,
              color: color.withOpacity(0.05),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: Text(station.landmark),
                subtitle: const Text("Within walking distance"),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle("First & Last Train"),
            _timingTable(),
          ],
        ),
      ),
    );
  }

  Widget _headerSection(BuildContext context, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.subway_rounded, size: 40, color: color),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                station.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Station ID: MRT-${station.id}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _facilityGrid() {
    final facilities = [
      {'icon': Icons.elevator, 'label': 'Lift'},
      {'icon': Icons.accessible, 'label': 'Ramp'},
      {'icon': Icons.wc, 'label': 'Toilet'},
      {'icon': Icons.atm, 'label': 'ATM'},
      {'icon': Icons.local_parking, 'label': 'Parking'},
      {'icon': Icons.medical_services_outlined, 'label': 'First Aid'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: facilities.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(facilities[index]['icon'] as IconData, color: Colors.grey[700]),
              const SizedBox(height: 4),
              Text(facilities[index]['label'] as String, style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Widget _timingTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, borderRadius: BorderRadius.circular(8)),
      children: const [
        TableRow(
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
          children: [
            Padding(padding: EdgeInsets.all(12), child: Text("Direction", style: TextStyle(fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.all(12), child: Text("First", style: TextStyle(fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.all(12), child: Text("Last", style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(12), child: Text("Towards Modipuram")),
            Padding(padding: EdgeInsets.all(12), child: Text("06:10 AM")),
            Padding(padding: EdgeInsets.all(12), child: Text("10:15 PM")),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(12), child: Text("Towards MRT South")),
            Padding(padding: EdgeInsets.all(12), child: Text("06:30 AM")),
            Padding(padding: EdgeInsets.all(12), child: Text("10:45 PM")),
          ],
        ),
      ],
    );
  }
}
