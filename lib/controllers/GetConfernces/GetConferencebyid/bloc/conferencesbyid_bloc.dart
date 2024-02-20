import 'dart:async';
import 'package:codehub/models/conferences/conferece_ui_modelbyid.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repos/Conferencebyid_repo.dart';
import '../repos/conferencebyid_repo.dart';

part 'conferencebyid_event.dart';
part 'conferencebyid_state.dart';

var client = http.Client();

class ConferencesByIdBloc extends Bloc<PostConferences, ConferenceState> {
  ConferencesByIdBloc() : super(ConferenceByIdInitial()) {
    on<ConferenceInitialFetchEventById>(
        (event, emit) => _fetchConferenceById(event.id, emit));
  }

  Future<void> _fetchConferenceById(
      String id, Emitter<ConferenceState> emit) async {
    emit(ConferenceFetchingLoadingState());
    try {
      ConferenceBYid conferenceData =
          await ConferenceByIdRepos.fetchConferencesbyid(id);
      emit(ConferenceFetchingSuccessfulState(conference: conferenceData));
    } catch (error) {
      emit(ConferenceFetchingErrorState());
    }
  }
}
