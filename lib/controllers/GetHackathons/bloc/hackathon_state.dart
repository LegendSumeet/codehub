part of 'hackathons_bloc.dart';

@immutable
abstract class HackathonsState {}

abstract class HackathonsActionState extends HackathonsState {}

class HackathonsInitial extends HackathonsState {}

class HackathonsFetchingLoadingState extends HackathonsState {}

class HackathonsFetchingErrorState extends HackathonsState {}

class HackathonsFetchingSuccessfulState extends HackathonsState {
  final List<Hacakthon> hackathons;

  HackathonsFetchingSuccessfulState({required this.hackathons});
}

class HackathonsAdditionSuccessState extends HackathonsActionState {}

class HackathonsAdditionErrorState extends HackathonsActionState {}
