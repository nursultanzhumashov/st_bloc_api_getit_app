import 'package:st_bloc_api_app/services/boredService.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;

  HomeBloc(this._boredService) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadedState(activity));
    });
  }
}
