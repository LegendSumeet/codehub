import 'dart:async';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/models/conferences/conferences_ui_model.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repos/Conference_repo.dart';
part 'Conference_event.dart';
part 'Conference_state.dart';

var client = http.Client();

class ConferenceBloc extends Bloc<PostConference, ConferenceState> {
  ConferenceBloc() : super(ConferenceInitial()) {
    on<ConferenceInitialFetchEvent>(conferenceInitialFetchEvent);
  }
  Future<void> conferenceInitialFetchEvent(
      ConferenceInitialFetchEvent event, Emitter<ConferenceState> emit) async {
    emit(ConferenceFetchingLoadingState());
    try {
      List<Conferences> conference = await BootcampsRepo.fetchConfernece();
      emit(ConferenceFetchingSuccessfulState(ConferenceData: conference));
    } catch (error) {
      emit(ConferenceFetchingErrorState());
    }
  }
}
