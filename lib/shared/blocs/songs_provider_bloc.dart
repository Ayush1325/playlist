import 'package:bloc/bloc.dart';
import 'songs_provider_state.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'songs_provider_event.dart';

class MusicProviderBloc extends Bloc<SongsProviderEvent, SongsProviderState> {
  final SongsProviderAbstract songsProvider;

  MusicProviderBloc({@required this.songsProvider});

  @override
  SongsProviderState get initialState => SongsProviderState([]);

  @override
  Stream<SongsProviderState> mapEventToState(SongsProviderEvent event) async* {
    yield SongsProviderState(await songsProvider.songs);
  }
}