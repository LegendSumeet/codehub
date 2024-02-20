part of 'conferencesbyid_bloc.dart';


@immutable
abstract class ConferenceState {}

abstract class ConferenceActionState extends ConferenceState {}

class ConferenceByIdInitial extends ConferenceState {}

class ConferenceFetchingLoadingState extends ConferenceState {}

class ConferenceFetchingErrorState extends ConferenceState {}

class ConferenceFetchingSuccessfulState extends ConferenceState {
  final ConferenceBYid conference;
  ConferenceFetchingSuccessfulState({required this.conference});
}

class ConferenceAdditionSuccessState extends ConferenceActionState {}

class ConferenceAdditionErrorState extends ConferenceActionState {}
