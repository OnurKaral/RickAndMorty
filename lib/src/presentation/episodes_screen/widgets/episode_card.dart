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
              const SizedBox(height: 8),
              Text(
                episodeAirDate,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                episode,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
