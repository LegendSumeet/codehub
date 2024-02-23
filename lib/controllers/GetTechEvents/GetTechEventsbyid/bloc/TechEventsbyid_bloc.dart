import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../../../models/TechEventsModel/TechEventbyid_ui.dart';
import '../repos/TechEventsbyid_repo.dart';
part 'TechEventsbYid_eventbyid.dart';
part 'TechEventsbyid_state.dart';

var client = http.Client();

class TechEventsByIdBloc extends Bloc<PostTechEvents, TechEventsState> {
  TechEventsByIdBloc() : super(TechEventsByIdInitial()) {
    on<TechEventInitialFetchEventById>(
        (event, emit) => fetchTechEventInitialById(event.id, emit));
  }
  Future<void> fetchTechEventInitialById(
      String id, Emitter<TechEventsState> emit) async {
    emit(TechEventsByIdFetchingLoadingState());
    try {
      TechEventsByid techEvent =
          await GetTechEventsByIdRepo.fetchTecheventsbyid(id);
      emit(TechEventsByIdFetchingSuccessfulState(techEvent: techEvent));
    } catch (error) {
      emit(TechEventsFetchingByIdErrorState());
    }
  }
}
