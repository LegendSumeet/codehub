part of 'hackathonsbyid_bloc.dart';

@immutable
abstract class HackathonsState {}

abstract class HackathonsActionState extends HackathonsState {}

class HackathonsByIdInitial extends HackathonsState {}

class HackathonsByIdFetchingLoadingState extends HackathonsState {}

class HackathonsFetchingByIdErrorState extends HackathonsState {}

class HackathonsByIdFetchingSuccessfulState extends HackathonsState {
  final Hacakthonbyid hackathons;
  HackathonsByIdFetchingSuccessfulState({required this.hackathons});
}

class HackathonsAdditionSuccessState extends HackathonsActionState {}

class HackathonsAdditionErrorState extends HackathonsActionState {}
