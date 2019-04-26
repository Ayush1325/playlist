import 'package:playlist/shared/blocs/download_bloc.dart';

abstract class DownloadHelperAbstract {
  void setListener(DownloadBloc downloadBloc);
  void start(String name, String url);
  void dispose();
}