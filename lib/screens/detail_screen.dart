import 'package:flutter/material.dart';
import '../model/model.dart'; 
import 'package:flutter/widgets.dart' as FlutterImage;

class DetailsScreen extends StatelessWidget {
  final Show movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.name ?? "Movie Details",
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: movie.id ?? '',
                    child: movie.image != null
                        ? FlutterImage.Image.network(
                            movie.image!.original!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.black12,
                            child: const Center(
                              child: Text(
                                'No Image Available',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (movie.rating?.average != null)
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text(
                                  movie.rating!.average.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          const Spacer(),
                          if (movie.runtime != null)
                            Row(
                              children: [
                                const Icon(Icons.access_time, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  "${movie.runtime} min",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        movie.name ?? "",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        movie.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Genres
                      if (movie.genres != null && movie.genres!.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          children: movie.genres!
                              .map((genre) => Chip(
                                    label: Text(genre),
                                    backgroundColor: Colors.blue.shade50,
                                  ))
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
