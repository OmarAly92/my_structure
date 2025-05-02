import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

@Deprecated('NO longer used')
class AppBlocObserver extends TalkerBlocObserver {
  // final _logger = Logger(
  //   printer: PrettyPrinter(
  //     methodCount: 0,
  //   ),
  // );
  //
  // @override
  // void onCreate(BlocBase bloc) {
  //   super.onCreate(bloc);
  //   if (kDebugMode) {
  //     _logger.i('onCreate -- ${bloc.runtimeType}');
  //   }
  // }
  //
  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //
  //   if (kDebugMode) {
  //     _logger.i('onEvent -- ${bloc.runtimeType}, $event');
  //   }
  // }
  //
  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   if (kDebugMode) {
  //     _logger.i('onChange -- ${bloc.runtimeType}, $change');
  //   }
  // }
  //
  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   if (kDebugMode) {
  //     _logger.i('onTransition -- ${bloc.runtimeType}, $transition');
  //   }
  // }
  //
  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   if (kDebugMode) {
  //     _logger.i('onError -- ${bloc.runtimeType}, $error');
  //   }
  //   super.onError(bloc, error, stackTrace);
  // }
  //
  // @override
  // void onClose(BlocBase bloc) {
  //   super.onClose(bloc);
  //   if (kDebugMode) {
  //     _logger.i('onClose -- ${bloc.runtimeType}');
  //   }
  // }
}
