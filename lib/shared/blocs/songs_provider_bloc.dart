import 'package:bloc/bloc.dart';
import 'songs_provider_state.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:playlist/shared/abstracts/songs_provider_abstract.dart';
import 'songs_provider_event.dart';

class MusicProviderBloc extends Bloc<SongsProviderEvent, SongsState> {
  final SongsProviderAbstract songsProvider;

  MusicProviderBloc({@required this.songsProvider});

  @override
  SongsState get initialState => SongsState([]);

  @override
  Stream<SongsState> mapEventToState(SongsProviderEvent event) async* {
    yield SongsState(await songsProvider.songs);
  }
}