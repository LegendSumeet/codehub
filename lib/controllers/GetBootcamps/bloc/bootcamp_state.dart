part of 'bootcamps_bloc.dart';

@immutable
abstract class BootCampsState {}

abstract class BootcampsActionState extends BootCampsState {}

class BootCampsInitial extends BootCampsState {}

class BootCampsFetchingLoadingState extends BootCampsState {}

class BootCampsFetchingErrorState extends BootCampsState {}

class BootCampsFetchingSuccessfulState extends BootCampsState {
  final  List<BootcampModel> bootcamps;

  BootCampsFetchingSuccessfulState({required this.bootcamps});
}

class PostsAdditionSuccessState extends BootcampsActionState {}

class PostsAdditionErrorState extends BootcampsActionState {}
