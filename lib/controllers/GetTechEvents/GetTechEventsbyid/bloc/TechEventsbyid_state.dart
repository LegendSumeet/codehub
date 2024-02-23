part of 'TechEventsbyid_bloc.dart';

@immutable
abstract class TechEventsState {}

abstract class TechEventsActionState extends TechEventsState {}

class TechEventsByIdInitial extends TechEventsState {}

class TechEventsByIdFetchingLoadingState extends TechEventsState {}

class TechEventsFetchingByIdErrorState extends TechEventsState {}

class TechEventsByIdFetchingSuccessfulState extends TechEventsState {
  final TechEventsByid techEvent;
  TechEventsByIdFetchingSuccessfulState({required this.techEvent});
}

class TechEventsAdditionSuccessState extends TechEventsActionState {}

class TechEventsAdditionErrorState extends TechEventsActionState {}
