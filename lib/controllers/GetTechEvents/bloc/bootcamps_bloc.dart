import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repos/bootcamps_repo.dart';

part 'bootcamp_event.dart';
part 'bootcamp_state.dart';

var client = http.Client();

class BootcampsBloc extends Bloc<PostBootcamps, BootCampsState> {
  BootcampsBloc() : super(BootCampsInitial()) {
    on<BootCampInitialFetchEvent>(bootCampInitialFetchEvent);
  }

  Future<void> bootCampInitialFetchEvent(
      BootCampInitialFetchEvent event, Emitter<BootCampsState> emit) async {
    emit(BootCampsFetchingLoadingState());
    try {
      List<BootcampModel> bootcampsdata = await BootcampsRepo.fetchBootcamps();
      emit(BootCampsFetchingSuccessfulState(bootcamps: bootcampsdata));
    } catch (error) {
      emit(BootCampsFetchingErrorState());
    }
  }
}
