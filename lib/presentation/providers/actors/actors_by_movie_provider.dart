import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/domain/entities/actor.dart';
import 'actors_repository_providers.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRespositoryProvider);

  return ActorsByMovieNotifier(getActor: actorsRepository.getActorByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActor;
  ActorsByMovieNotifier({required this.getActor}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActor(movieId);

    state = {...state, movieId: actors};
  }
}
