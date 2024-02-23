part of 'TechEvents_bloc.dart';

@immutable
abstract class TechEventsState {}

abstract class TechEventsActionState extends TechEventsState {}

class TechEventsInitial extends TechEventsState {}

class TechEventsFetchingLoadingState extends TechEventsState {}

class TechEventsFetchingErrorState extends TechEventsState {}

class TechEventsFetchingSuccessfulState extends TechEventsState {
  final List<TechEvents> techEvents;

  TechEventsFetchingSuccessfulState({required this.techEvents});
}

class TechEventsAdditionSuccessState extends TechEventsActionState {}

class TechEventsAdditionErrorState extends TechEventsActionState {}
