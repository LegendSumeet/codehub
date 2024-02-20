part of 'Conference_bloc.dart';

@immutable
abstract class ConferenceState {}

abstract class ConferenceActionState extends ConferenceState {}

class ConferenceInitial extends ConferenceState {}

class ConferenceFetchingLoadingState extends ConferenceState {}

class ConferenceFetchingErrorState extends ConferenceState {}

class ConferenceFetchingSuccessfulState extends ConferenceState {
  final  List<Conferences> ConferenceData;

  ConferenceFetchingSuccessfulState({required this.ConferenceData});
}

class ConferenceAdditionSuccessState extends ConferenceActionState {}

class ConferenceAdditionErrorState extends ConferenceActionState {}
