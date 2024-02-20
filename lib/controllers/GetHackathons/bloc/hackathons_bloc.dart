import 'dart:async';
import 'package:codehub/models/HackathonModel/hackathon_ui.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repos/hackathon_repo.dart';

part 'hackathon_event.dart';
part 'hackathon_state.dart';

var client = http.Client();

class HackathonsBloc extends Bloc<PostHackathons, HackathonsState> {
  HackathonsBloc() : super(HackathonsInitial()) {
    on<HackathonInitialFetchEvent>(_fetchHackathons);
  }

  Future<void> _fetchHackathons(
      HackathonInitialFetchEvent event, Emitter<HackathonsState> emit) async {
    emit(HackathonsFetchingLoadingState());
    try {
      List<Hacakthon> hackathonsData = await HackathonsRepo.fetchHackathon();
      emit(HackathonsFetchingSuccessfulState(hackathons: hackathonsData));
    } catch (error) {
      emit(HackathonsFetchingErrorState());
    }
  }
}
