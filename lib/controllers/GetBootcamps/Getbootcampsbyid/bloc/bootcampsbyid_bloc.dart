import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_modelbyid.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repos/bootcampsbyid_repo.dart';


part 'bootcampsbyid_eventbyid.dart';
part 'bootcampsbyid_state.dart';

var client = http.Client();

class BootcampsbyidBloc extends Bloc<PostBootcamps, BootCampsState> {
  BootcampsbyidBloc() : super(BootCampsbyidInitial()) {
    on<BootCampInitialFetchEventbyid>(
        (event, emit) => bootCampInitialFetchEventbyid(event.id, event, emit));
  }

  Future<void> bootCampInitialFetchEventbyid(String id,
      BootCampInitialFetchEventbyid event, Emitter<BootCampsState> emit) async {
    emit(BootCampsbyidFetchingLoadingState());
    try {
      BootcampsByid bootcampsdata = await BootcampsbyidRepo.fetchBootcampsbyid(id);
      emit(BootCampsbyidFetchingSuccessfulState(bootcamps: bootcampsdata));
    } catch (error) {
      emit(BootCampsFetchingbyidErrorState());
    }
  }
}
