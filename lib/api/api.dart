import 'package:MovieTorrentDownloader/Model/listmovies.dart';
import 'package:http/http.dart' as http;

class Api{

  static Future<ListMovies> listMovies() async{

    String url="https://yts.mx/api/v2/list_movies.json";
   http.Response response= await http.get(url);

   return ListMovies.fromJson(response.body);

  }
}