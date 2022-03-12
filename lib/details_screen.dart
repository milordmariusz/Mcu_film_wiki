import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/mcu_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.mcuMoviesList})
      : super(key: key);

  final McuModels mcuMoviesList;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          widget.mcuMoviesList.coverUrl != null
              ? CachedNetworkImage(
                  imageUrl: widget.mcuMoviesList.coverUrl.toString(),
                  placeholder: (context, url) =>
                      Image.asset('images/place_holder.jpg'),
                )
              : Image.asset('images/place_holder.jpg'),
          Text(widget.mcuMoviesList.title.toString()),
          Text(widget.mcuMoviesList.overview.toString()),
          Text(widget.mcuMoviesList.directedBy.toString()),
        ],
      ),
    );
  }
}
