import 'package:flutter/material.dart';
import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  final int id;
  const MovieDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsViewBody(id: id),
    );
  }
}
