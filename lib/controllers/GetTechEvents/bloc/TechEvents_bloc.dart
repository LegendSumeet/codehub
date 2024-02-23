import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../../models/TechEventsModel/TechEventbyid_ui.dart';
import '../../../models/TechEventsModel/techevent_ui.dart';
import '../repos/TechEvents_repo.dart';

part 'TechEvents_event.dart';
part 'TechEvents_state.dart';

var client = http.Client();

class TechEventsBloc extends Bloc<PostTechEvents, TechEventsState> {
  TechEventsBloc() : super(TechEventsInitial()) {
    on<TechEventsInitialFetchEvent>(fetchTechEvents);
  }

  Future<void> fetchTechEvents(
      TechEventsInitialFetchEvent event, Emitter<TechEventsState> emit) async {
    emit(TechEventsFetchingLoadingState());
    try {
      List<TechEvents> techEventsData = await TechEventsRepo.fetchTechEvents();
      emit(TechEventsFetchingSuccessfulState(techEvents: techEventsData));
    } catch (error) {
      emit(TechEventsFetchingErrorState());
    }
  }
}
