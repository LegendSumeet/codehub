import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/openrepomodel/openrepobyid.dart';
import '../repos/bootcampsbyid_repo.dart';

part 'programsbyid_eventbyid.dart';
part 'programsbyid_state.dart';


class OpenRepobyidBloc extends Bloc<PostProgramsBYIDs, ProgramsBYIDsState> {
  OpenRepobyidBloc() : super(ProgramsBYIDsbyidInitial()) {
    on<ProgramsBYIDInitialFetchEventbyid>((event, emit) =>
        getrepobyidInitialFetchEventbyid(event.id, event, emit));
  }

  Future<void> getrepobyidInitialFetchEventbyid(
      String id,
      ProgramsBYIDInitialFetchEventbyid event,
      Emitter<ProgramsBYIDsState> emit) async {
    emit(ProgramsBYIDsbyidFetchingLoadingState());
    try {
      OpenRepobyid bootcampsdata = await GetProgamsbyid.fetchprogramsbyid(id);
      emit(ProgramsBYIDsbyidFetchingSuccessfulState(
          programsBYIDs: bootcampsdata));
    } catch (error) {
      emit(ProgramsBYIDsFetchingbyidErrorState());
    }
  }
}
