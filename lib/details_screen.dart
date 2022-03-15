import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: widget.mcuMoviesList.coverUrl != null
                  ? Image.network(
                      widget.mcuMoviesList.coverUrl.toString(),
                      width: size.width * 3 / 4,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/place_holder.jpg',
                        width: size.width * 3 / 4,
                      )),
            ),
          ),
          SizedBox(height: size.height / 20),
          Text(
            widget.mcuMoviesList.title.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height / 30),
          Text(
            widget.mcuMoviesList.overview.toString(),
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: size.height / 30),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: "Directed by:  ", style: TextStyle(color: Colors.white)),
                TextSpan(text: widget.mcuMoviesList.directedBy.toString(), style: TextStyle(color: Colors.orange)),
              ]
            )
          ),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Realise date:  ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: widget.mcuMoviesList.releaseDate.toString(), style: TextStyle(color: Colors.orange)),
                  ]
              )
          ),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Duration: ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: widget.mcuMoviesList.duration.toString(), style: TextStyle(color: Colors.orange)),
                    TextSpan(text: " min", style: TextStyle(color: Colors.orange)),
                  ]
              )
          ),
          SizedBox(height: size.height / 30),

          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Box office:  ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: widget.mcuMoviesList.boxOffice.toString(), style: TextStyle(color: Colors.orange)),
                    TextSpan(text: " \$", style: TextStyle(color: Colors.orange)),

                  ]
              )
          ),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Phase:  ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: widget.mcuMoviesList.phase.toString(), style: TextStyle(color: Colors.orange)),
                  ]
              )
          ),
          SizedBox(height: size.height / 30),
          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Chronology:  ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: widget.mcuMoviesList.chronology.toString(), style: TextStyle(color: Colors.orange)),
                  ]
              )
          ),
        ],
      ),
    );
  }
}
