part of 'bootcampsbyid_bloc.dart';

@immutable
abstract class PostBootcamps {}

class BootCampInitialFetchEventbyid extends PostBootcamps {
  final String id;

  BootCampInitialFetchEventbyid({required this.id});
}
