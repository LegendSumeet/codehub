part of 'hackathonsbyid_bloc.dart';

@immutable
abstract class PostHackathons {}

class HackathonInitialFetchEventById extends PostHackathons {
  final String id;

  HackathonInitialFetchEventById(this.id);
}
