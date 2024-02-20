part of 'bootcampsbyid_bloc.dart';
@immutable
abstract class BootCampsState {}

abstract class BootcampsActionState extends BootCampsState {}

class BootCampsbyidInitial extends BootCampsState {}

class BootCampsbyidFetchingLoadingState extends BootCampsState {}

class BootCampsFetchingbyidErrorState extends BootCampsState {}

class BootCampsbyidFetchingSuccessfulState extends BootCampsState {
  final  BootcampsByid bootcamps;

  BootCampsbyidFetchingSuccessfulState({required this.bootcamps});
}

class PostsAdditionSuccessState extends BootcampsActionState {}

class PostsAdditionErrorState extends BootcampsActionState {}
