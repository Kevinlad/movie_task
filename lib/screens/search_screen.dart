import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/api/api.dart';
import 'package:movie_task/controller.dart/search_controller.dart';
import 'package:movie_task/screens/detail_screen.dart';
import 'package:movie_task/model/model.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  final SearchBarController searchBarController =
      Get.put(SearchBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: searchTextController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search Movies...",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onSubmitted: (query) {
            searchBarController.searchMovies(query);
          },
        ),
      ),
      body: Obx(() {
        if (searchBarController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (searchBarController.movieList.isEmpty) {
          return Center(child: Text("No movies found"));
        } else {
          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: searchBarController.movieList.length,
            itemBuilder: (context, index) {
              var movie = searchBarController.movieList[index].show!;
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(movie: movie));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            movie.image?.medium ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  "Image not loaded",
                                  style: TextStyle(color: Colors.red),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ),
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
