import 'package:flutter/material.dart';
import 'package:meerut_metro/screens/fare_chart_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: const Text('Metro Info & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard(
            context,
            "Operational Hours",
            "06:00 AM - 10:30 PM",
            Icons.access_time,
            color,
          ),
          _buildInfoCard(
            context,
            "Peak Frequency",
            "Every 6 Minutes",
            Icons.av_timer,
            Colors.orange,
          ),
          _buildInfoCard(
            context,
            "Customer Care",
            "1800-200-1925",
            Icons.support_agent,
            Colors.green,
          ),
          const SizedBox(height: 24),
          const Text("Quick Access", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          _quickActionTile(context, Icons.payments_outlined, "Fare Chart", "View ticket pricing guide", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FareChartScreen()));
          }),
          _quickActionTile(context, Icons.security, "Security Hotline", "Emergency contact for help", () {}),
          _quickActionTile(context, Icons.help_center_outlined, "Lost & Found", "Inquire about lost items", () {}),
          _quickActionTile(context, Icons.language, "Official Website", "Go to NCRTC portal", () {}),
          const SizedBox(height: 24),
          const Text("About the Project", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: const Text(
              "Meerut Metro is part of the integrated rapid transit project. It covers 31 km across Meerut with 13 stations, providing high-speed connectivity while sharing tracks with the RRTS.",
              style: TextStyle(height: 1.6, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickActionTile(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}
