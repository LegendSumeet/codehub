part of 'programsbyid_bloc.dart';

@immutable
abstract class ProgramsBYIDsState {}

abstract class ProgramsBYIDsActionState extends ProgramsBYIDsState {}

class ProgramsBYIDsbyidInitial extends ProgramsBYIDsState {}

class ProgramsBYIDsbyidFetchingLoadingState extends ProgramsBYIDsState {}

class ProgramsBYIDsFetchingbyidErrorState extends ProgramsBYIDsState {}

class ProgramsBYIDsbyidFetchingSuccessfulState extends ProgramsBYIDsState {
  final OpenRepobyid programsBYIDs;
  ProgramsBYIDsbyidFetchingSuccessfulState({required this.programsBYIDs});
}

class PostsAdditionSuccessState extends ProgramsBYIDsActionState {}

class PostsAdditionErrorState extends ProgramsBYIDsActionState {}
