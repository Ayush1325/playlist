import 'dart:async';
import 'package:bloc/bloc.dart';
import 'songs_provider_bloc.dart';
import 'package:meta/meta.dart';
import 'package:playlist/shared/abstracts/download_helper_abstract.dart';
import 'download_event.dart';
import 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final MusicProviderBloc musicProviderBloc;
  final DownloadHelperAbstract downloadHelperAbstract;

  DownloadBloc({@required this.musicProviderBloc, @required this.downloadHelperAbstract}) {
    downloadHelperAbstract.setListener(this);
  }

  @override
  DownloadState get initialState => InitialDownloadState();

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) async* {
    if (event is NormalDownloadEvent) {
      final temp = musicProviderBloc.currentState.songs[event.id];
      downloadHelperAbstract.start(temp.title, temp.songUrl);
    }
    else if (event is CompletedDownloadEvent) {
      yield CompletedDownloadState();
    }
  }

  @override
  void dispose() {
    super.dispose();
    downloadHelperAbstract.dispose();
  }


}
