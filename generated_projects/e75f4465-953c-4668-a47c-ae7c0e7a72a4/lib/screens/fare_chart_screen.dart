import 'package:flutter/material.dart';

class FareChartScreen extends StatelessWidget {
  const FareChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fare Information")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            color: Color(0xFF0055A4),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Standard Ticket Fare", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Based on distance traveled", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _fareRow("0 - 2 KM", "₹ 20"),
          _fareRow("2 - 5 KM", "₹ 30"),
          _fareRow("5 - 12 KM", "₹ 40"),
          _fareRow("12 - 21 KM", "₹ 50"),
          _fareRow("21 - 32 KM", "₹ 60"),
          _fareRow("32+ KM", "₹ 70"),
          const SizedBox(height: 24),
          const Text("Smart Card Benefits", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _benefitTile(Icons.percent, "10% Discount", "Get 10% off on every journey compared to single tokens."),
          _benefitTile(Icons.timer, "Saves Time", "No need to stand in queue for daily tickets."),
          _benefitTile(Icons.sync, "Easy Recharge", "Recharge via UPI, Net Banking, or at help desks."),
        ],
      ),
    );
  }

  Widget _fareRow(String distance, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(distance, style: const TextStyle(fontSize: 16)),
          Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _benefitTile(IconData icon, String title, String desc) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundColor: Colors.blue.withOpacity(0.1), child: Icon(icon, size: 20, color: Colors.blue)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(desc),
    );
  }
}
