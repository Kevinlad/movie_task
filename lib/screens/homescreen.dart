import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/controller.dart/movie_controller.dart';
import 'detail_screen.dart';
import 'package:flutter/widgets.dart' as FlutterImage;

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchTap;

  const HomeScreen({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF24262B),
        title: GestureDetector(
          onTap: onSearchTap,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Search Movies...",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (movieController.moviesList.isEmpty) {
          return const Center(child: Text("No movies available"));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6, 
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: movieController.moviesList.length,
            itemBuilder: (context, index) {
              var movie = movieController.moviesList[index].show!;
              return GestureDetector(
                onTap: () {
                
                  Get.to(() => DetailsScreen(movie: movie));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF24262B),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: FlutterImage.Image.network(
                            movie.image?.medium ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text(
                                  "Image not loaded",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          movie.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                              "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
