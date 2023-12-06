part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final AllServiceRequestsModel allServiceRequestsModel;

  HomeLoadedState({required this.allServiceRequestsModel});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}

class GetAllPartsLoadingState extends HomeState {}

class GetAllPartsLoadedState extends HomeState {
  final AllPartsModel allPartsModel;

  GetAllPartsLoadedState({required this.allPartsModel});
}

class GetAllPartsErrorState extends HomeState {
  final String message;

  GetAllPartsErrorState({required this.message});
}

class ChangeSelectedPartLoadingState extends HomeState {}

class ChangeSelectedPartLoadedState extends HomeState {}

class ChangeSelectedPartErrorState extends HomeState {
  final String message;

  ChangeSelectedPartErrorState({required this.message});
}
