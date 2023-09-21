import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String characterName;
  final String characterSpecies;
  final String characterStatus;
  final String characterImage;
  final Color statusColor;

  const CharacterCard({
    super.key,
    required this.characterName,
    required this.characterSpecies,
    required this.characterStatus,
    required this.characterImage,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.blueGrey[800], // Dark futuristic background color
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            characterImage,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          characterName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white, // White text color for contrast
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              characterSpecies,
              style: const TextStyle(
                color: Colors.white70, // Cyan text color
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4), // Add some spacing between the lines
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: statusColor, // Set the circle color based on status
                  ),
                ),
                const SizedBox(width: 8), // Add spacing between circle and text
                Text(
                  characterStatus,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.grey[400], // Light grey text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
