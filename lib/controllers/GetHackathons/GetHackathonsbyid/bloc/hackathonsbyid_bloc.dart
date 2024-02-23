import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/HackathonModel/hackathonbyid.dart';
import '../repos/hackthonsbyid_repo.dart';

part 'hackathonsbyid_event.dart';
part 'hackathonsbyid_state.dart';

var client = http.Client();

class HackathonsByIdBloc extends Bloc<PostHackathons, HackathonsState> {
  HackathonsByIdBloc() : super(HackathonsByIdInitial()) {
    on<HackathonInitialFetchEventById>((event, emit) => _fetchHackathonById(event.id, emit));
  }

  Future<void> _fetchHackathonById(String id, Emitter<HackathonsState> emit) async {
    emit(HackathonsByIdFetchingLoadingState());
    try {
      Hacakthonbyid hackathonData = await HackathonsByIdRepo.fetchhackathonsbyid(id);
      emit(HackathonsByIdFetchingSuccessfulState(hackathons: hackathonData));
    } catch (error) {
      emit(HackathonsFetchingByIdErrorState());
    }
  }
}
