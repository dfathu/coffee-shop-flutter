// *important this template event for bloc_bloc
// import 'dart:math';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_1/bloc/onboard/onboardbloc_event.dart';
// import 'package:test_1/bloc/onboard/onboardbloc_state.dart';
// import 'package:test_1/data/data_onboard.dart';

// class OnBoardBloc extends Bloc<OnBoardBlocEvent, OnBoardBlocState> {
//   OnBoardBloc() : super(const OnBoardBlocInitialState()) {
//     on<FetchDataEvent>(_onFetchDataEvent);
//   }

//   void _onFetchDataEvent(
//     FetchDataEvent event,
//     Emitter<OnBoardBlocState> emitter,
//   ) async {
//     emitter(const OnBoardBlocLoadingState());
//     await Future.delayed(const Duration(seconds: 2));
//     bool isSucceed = Random().nextBool();
//     if (isSucceed) {
//       List<OnBoardData> _dummyOnBoard = OnBoardData.demoOnBoard;
//       emitter(OnBoardBlocSuccessFetchState(onBoard: _dummyOnBoard));
//     } else {
//       emitter(const OnBoardBlocErrorFetchState(
//         errorMessage: "something went very wrong :(",
//       ));
//     }
//   }
// }
// *

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/bloc/onboard/onboardbloc_event.dart';
import 'package:test_1/bloc/onboard/onboardbloc_state.dart';

class IndexinBloc extends Bloc<IndexinEvent, IndexState> {
  IndexinBloc(this.init) : super(IndexinValueState(index: 0)) {
    on<IndexinEvent>(mapEventToState);
  }
  final int init;

  @override
  void mapEventToState(IndexinEvent event, Emitter<IndexState> emit) {
    if (event is ReIndexEvent) {
      print('bloc getValue by Event' + event.index.toString());
      state.indexin = event.index;
      print('bloc getValue by state' + state.indexin.toString());
      emit(IndexinValueState(index: state.indexin!));
    }
  }
}
