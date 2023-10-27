import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  final String episodeName;
  final String episodeAirDate;
  final String episode;

  const EpisodeCard({
    super.key,
    required this.episodeName,
    required this.episodeAirDate,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*  context.router.push(CharacterDetailRoute(
            episodeName: episodeName,
            episodeAirDate: episodeAirDate,
            episode: episode,
            characterImage: characterImage)); */
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.blueGrey[800],
        // Dark futuristic background color
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            episodeName,
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
                episodeAirDate,
                style: const TextStyle(
                  color: Colors.white70, // Cyan text color
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4), // Add some spacing between the lines
              Row(
                children: [
                  Text(
                    episode,
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
      ),
    );
  }
}
