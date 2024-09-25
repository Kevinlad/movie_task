import 'package:get/get.dart';
import 'package:movie_task/api/api.dart';
import 'package:movie_task/model/model.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var moviesList = <Welcome>[].obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  // Fetch all movies
  void fetchMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().fetchMovies();
      if (movies != null) {
        moviesList.assignAll(movies);
      }
    } finally {
      isLoading(false);
    }
  }

  // Search movies by query
  void searchMovies(String query) async {
    try {
      isLoading(true);
      var movies = await ApiService().searchMovies(query);
      if (movies != null) {
        moviesList.assignAll(movies);
      }
    } finally {
      isLoading(false);
    }
  }
}
