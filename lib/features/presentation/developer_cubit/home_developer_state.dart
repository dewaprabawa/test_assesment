part of 'home_developer_cubit.dart';

sealed class DeveloperState extends Equatable {
  const DeveloperState();

  @override
  List<Object> get props => [];
}

final class DeveloperInitial extends DeveloperState {}

final class DeveloperLoading extends DeveloperState {}

final class DeveloperLoaded extends DeveloperState {
  final List<DeveloperData> developers;

  const DeveloperLoaded({required this.developers});
}

final class DeveloperFailure extends DeveloperState {
  final String message;

  const DeveloperFailure({required this.message});
}



