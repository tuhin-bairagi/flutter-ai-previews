import 'package:flutter/material.dart';
import 'package:meerut_metro/models/station.dart';

class StationPicker extends StatelessWidget {
  final Station? source;
  final Station? destination;
  final ValueChanged<Station?> onSourceChanged;
  final ValueChanged<Station?> onDestinationChanged;
  final VoidCallback onSwap;

  const StationPicker({
    super.key,
    required this.source,
    required this.destination,
    required this.onSourceChanged,
    required this.onDestinationChanged,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildDropdown("Source", source, onSourceChanged, Icons.radio_button_checked),
                const SizedBox(height: 12),
                _buildDropdown("Destination", destination, onDestinationChanged, Icons.location_on),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: onSwap,
            icon: const Icon(Icons.swap_vert, color: Colors.white, size: 30),
            style: IconButton.styleFrom(backgroundColor: Colors.white24),
          )
        ],
      ),
    );
  }

  Widget _buildDropdown(String hint, Station? value, ValueChanged<Station?> onChanged, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Station>(
          value: value,
          isExpanded: true,
          hint: Text(hint),
          icon: Icon(icon, color: Colors.blue[800], size: 20),
          items: meerutStations.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
