import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mcu_film_wiki/Models/mcu_model.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
  static List<McuModels> mcuMoviesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarvelMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: mcuMoviesList.isNotEmpty
            ? GridView.builder(
                itemCount: mcuMoviesList.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: mcuMoviesList[index].coverUrl != null
                          ? CachedNetworkImage(
                              imageUrl: mcuMoviesList[index].coverUrl.toString(),
                              placeholder: (context, url) =>
                                  Image.asset('images/place_holder.jpg'),
                            )
                          : Image.asset('images/place_holder.jpg'),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //builder: (context) => DetailsScreen(title: mcuMoviesList[index].title.toString(), coverUrl: mcuMoviesList[index].coverUrl.toString() ,)),
                            builder: (context) => DetailsScreen(mcuMoviesList: mcuMoviesList[index])),
                      );
                    },
                  );
                },
              )
            : Center(
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.white70)),
              ));
  }

  void getMarvelMovies() {
    final uri = Uri.parse(marvelApiUrl);
    http.get(uri).then((response) {
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedData = jsonDecode(responseBody);
        final List marvelData = decodedData['data'];
        for (var i = 0; i < marvelData.length; i++) {
          final mcuMovie =
              McuModels.fromJson(marvelData[i] as Map<String, dynamic>);
          mcuMoviesList.add(mcuMovie);
        }
        setState(() {});
      } else {}
    }).catchError((err) {
      debugPrint('============ $err ==============');
    });
  }
}
