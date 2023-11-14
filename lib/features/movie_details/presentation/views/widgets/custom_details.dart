import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widget/custom_error.dart';
import 'package:movie_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/movie_details/presentation/views/widgets/some_details.dart';
import 'custom_app_bar_movie_details.dart';
import 'custom_image_movie_details.dart';
import 'loading_details.dart';

class CustomDetails extends StatefulWidget {
  final int id;

  const CustomDetails({super.key, required this.id});

  @override
  State<CustomDetails> createState() => _CustomDetailsState();
}

class _CustomDetailsState extends State<CustomDetails> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsSuccessState) {
          controller.forward();
        }
      },
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
                            cubit.fetchMovieDetails(id: widget.id);
                          })
                      : Expanded(
                          child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-0.4, 0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: controller,
                                curve: Curves.easeOut,
                              ),
                            ),
                            child: Column(children: [
                              CustomImageMovieDetails(imageUrl: cubit.details!.image.toString()),
                              SomeDetails(
                                name: cubit.details!.movieName,
                                desc: cubit.details!.desc.toString(),
                                date: cubit.details!.date.toString(),
                                numberOfComics:
                                    cubit.details!.numbersOfComics.toString(),
                                numbersOfEvents:
                                    cubit.details!.numbersOfEvents.toString(),
                                numbersOfSeries:
                                    cubit.details!.numbersOfSeries.toString(),
                                numbersOfStories:
                                    cubit.details!.numbersOfStories.toString(),
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
