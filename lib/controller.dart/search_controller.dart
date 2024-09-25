import 'package:get/get.dart';
import 'package:movie_task/api/api.dart';
import 'package:movie_task/model/model.dart';

class SearchBarController extends GetxController {
  var isLoading = false.obs;
  var movieList = <Welcome>[].obs;
  var query = "".obs;

  // Method to search movies using the API
  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      isLoading(true);
      try {
        var movies = await ApiService().searchMovies(query);
        movieList.assignAll(movies);
      } catch (e) {
        Get.snackbar("Error", "Failed to load movies");
      } finally {
        isLoading(false);
      }
    }
  }
}
