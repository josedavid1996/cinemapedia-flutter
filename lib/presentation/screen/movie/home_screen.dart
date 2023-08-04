import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigtion(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    ref.read(popularMoviesProviders.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final pupularMovies = ref.watch(popularMoviesProviders);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),

            MoviesSlideshow(movies: slideShowMovies),

            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () => ref
                    .read(nowPlayingMoviesProviders.notifier)
                    .loadNextPage()),

            MovieHorizontalListview(
                movies: pupularMovies,
                title: 'Próximamente',
                subTitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(popularMoviesProviders.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Populares',
                // subTitle: '',
                loadNextPage: () => ref
                    .read(nowPlayingMoviesProviders.notifier)
                    .loadNextPage()),

            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Mejor calificadas',
                subTitle: 'Desde siempre',
                loadNextPage: () => ref
                    .read(nowPlayingMoviesProviders.notifier)
                    .loadNextPage()),

            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
