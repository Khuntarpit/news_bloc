import 'package:bloc/bloc.dart';
import 'package:news_bloc/Utils/Constants.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printLog('${bloc.runtimeType} $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    printLog("Block creat");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printLog(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    printLog(error.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    printLog("Bloc close");
  }
}
