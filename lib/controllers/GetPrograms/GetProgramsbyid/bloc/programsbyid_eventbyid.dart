part of 'programsbyid_bloc.dart';

@immutable
abstract class PostProgramsBYIDs{}


class ProgramsBYIDInitialFetchEventbyid extends PostProgramsBYIDs{
  final String id;

  ProgramsBYIDInitialFetchEventbyid(this.id);
}