// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  // final String activityName;
  // final String activityUserName;
  // final int activityId;
  final List<BoredActivity> myList;

  HomeLoadedState(this.myList);

  @override
  // TODO: implement props
  List<Object?> get props => [myList];
}
