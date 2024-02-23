part of 'TechEventsbyid_bloc.dart';

@immutable
abstract class PostTechEvents {}

class TechEventInitialFetchEventById extends PostTechEvents {
  final String id;

  TechEventInitialFetchEventById(this.id);
}
