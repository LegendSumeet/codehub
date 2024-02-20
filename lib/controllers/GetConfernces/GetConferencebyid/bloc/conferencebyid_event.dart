part of 'conferencesbyid_bloc.dart';

@immutable
abstract class PostConferences {}

class ConferenceInitialFetchEventById extends PostConferences {
  final String id;

  ConferenceInitialFetchEventById(this.id);
}
