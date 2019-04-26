import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DownloadEvent extends Equatable {
  DownloadEvent([List props = const []]) : super(props);
}

class NormalDownloadEvent extends DownloadEvent {
  final int id;
  NormalDownloadEvent(this.id): super([id]);
}

class CompletedDownloadEvent extends DownloadEvent {
  final String id;
  CompletedDownloadEvent(this.id): super([id]);
}
