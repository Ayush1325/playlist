import 'package:playlist/Firebase_data_provider.dart';
import 'package:bloc/bloc.dart';
import 'songs_state.dart';
import 'dart:async';
import 'songs_provider_event.dart';

class MusicProviderBloc extends Bloc<SongsProviderEvent, SongsState> {

  @override
  SongsState get initialState => SongsState([]);

  @override
  Stream<SongsState> mapEventToState(SongsProviderEvent event) async* {
    final temp = FirebaseDataProvider();
    yield SongsState(await temp.songs);
  }
}