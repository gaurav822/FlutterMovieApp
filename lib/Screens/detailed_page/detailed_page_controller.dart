
import 'package:MovieTorrentDownloader/api/api.dart';
import 'package:MovieTorrentDownloader/model/movie_details.dart';
import 'package:get/state_manager.dart';

class DetailedPageController extends GetxController {
  final int id;
  DetailedPageController(this.id) {
    _getMovieDetails();
  }

  List<Cast> casts = List();

  _getMovieDetails() async {
    MovieDetails movieDetails = await Api.movieDetails(id: id);
    casts = movieDetails.data.movie.cast;
    update();
  }
}
