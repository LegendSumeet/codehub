part of 'open_source_programs_bloc.dart';

@immutable
abstract class OpenSourceProgramsState {}

abstract class OpenSourceProgramsActionState extends OpenSourceProgramsState {}

class OpenSourceProgramsInitial extends OpenSourceProgramsState {}

class OpenSourceProgramsFetchingLoadingState extends OpenSourceProgramsState {}

class OpenSourceProgramsFetchingErrorState extends OpenSourceProgramsState {}

class OpenSourceProgramsFetchingSuccessfulState extends OpenSourceProgramsState {
  final List<OpenRepo> programs;

  OpenSourceProgramsFetchingSuccessfulState({required this.programs});
}

class OpenSourceProgramsAdditionSuccessState extends OpenSourceProgramsActionState {}

class OpenSourceProgramsAdditionErrorState extends OpenSourceProgramsActionState {}
