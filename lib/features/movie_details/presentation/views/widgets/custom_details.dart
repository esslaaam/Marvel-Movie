import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widget/custom_error.dart';
import 'package:movie_app/core/widget/fade_animation.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/views/widgets/some_details.dart';
import 'custom_app_bar_movie_details.dart';
import 'custom_image_movie_details.dart';
import 'loading_details.dart';

class CustomDetails extends StatelessWidget {
  final int id;

  const CustomDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<MovieDetailsCubit>(context);
        return SafeArea(
          child: Column(
            children: [
              const CustomAppBarMovieDetails(),
              state is MovieDetailsLoadingState
                  ? const LoadingDetails()
                  : state is MovieDetailsFailureState
                      ? CustomError(
                          errMsg: state.errMsg,
                          onPressed: () {
                            cubit.fetchMovieDetails(id: id);
                          })
                      : Expanded(
                          child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: FadeAnimation(
                            0.2,
                            1,
                            Column(children: [
                              CustomImageMovieDetails(
                                  imageUrl: cubit.details!.image.toString()),
                              SomeDetails(
                                name: cubit.details!.movieName,
                                desc: cubit.details!.desc.toString(),
                                date: cubit.details!.date.toString(),
                                numberOfComics: cubit.details!.numbersOfComics.toString(),
                                numbersOfEvents: cubit.details!.numbersOfEvents.toString(),
                                numbersOfSeries: cubit.details!.numbersOfSeries.toString(),
                                numbersOfStories: cubit.details!.numbersOfStories.toString(),
                              ),
                            ]),
                          ),
                        ))
            ],
          ),
        );
      },
    );
  }
}
