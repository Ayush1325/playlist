import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DownloadState extends Equatable {
  DownloadState([List props = const []]) : super(props);
}

class InitialDownloadState extends DownloadState {}

class CompletedDownloadState extends DownloadState {}
