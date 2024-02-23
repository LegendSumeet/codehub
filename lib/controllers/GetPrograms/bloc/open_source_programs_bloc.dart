import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/openrepomodel/openrepo_ui_model.dart';
import '../repos/Programs_repo.dart';

part 'Open_source_event.dart';
part 'open_source_state.dart';

var client = http.Client();

class OpenSourcesBloc
    extends Bloc<PostOpenSourcePrograms, OpenSourceProgramsState> {
  OpenSourcesBloc() : super(OpenSourceProgramsInitial()) {
    on<OpenSourceProgramsInitialFetchEvent>(opensourceInitialFetchEvent);
  }

  Future<void> opensourceInitialFetchEvent(
      OpenSourceProgramsInitialFetchEvent event,
      Emitter<OpenSourceProgramsState> emit) async {
    emit(OpenSourceProgramsFetchingLoadingState());
    try {
      List<OpenRepo> bootcampsdata = await GetProgramsRepo.fetchPrograms();
      emit(OpenSourceProgramsFetchingSuccessfulState(programs: bootcampsdata));
    } catch (error) {
      emit(OpenSourceProgramsAdditionErrorState());
    }
  }
}
