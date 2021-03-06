import 'dart:io';
import 'dart:typed_data';
import 'package:MovieTorrentDownloader/api/api.dart';
import 'package:MovieTorrentDownloader/model/movie_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as pp;


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

  downloadTorrent(String title, String url)async{
    Directory downloadDir= await pp.getExternalStorageDirectory();
    // print(downloadDir.path);

    File torrentFile = File(downloadDir.path + "/" +title+".torrent");

    http.Response response=await http.get(url);
    Uint8List content= response.bodyBytes;
    torrentFile.writeAsBytesSync(content);
    Get.back();
    print("download complete");
  }
}
