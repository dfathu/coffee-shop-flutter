// import 'package:equatable/equatable.dart';
// import 'package:test_1/data/data_onboard.dart';

// *important this template event for bloc_state with data

// abstract class OnBoardBlocState extends Equatable {
//   const OnBoardBlocState();
// }

// class OnBoardBlocInitialState extends OnBoardBlocState {
//   const OnBoardBlocInitialState();

//   @override
//   List<Object?> get props => [];
// }

// class OnBoardBlocLoadingState extends OnBoardBlocState {
//   const OnBoardBlocLoadingState();

//   @override
//   List<Object?> get props => [];
// }

// class OnBoardBlocErrorFetchState extends OnBoardBlocState {
//   final String errorMessage;
//   const OnBoardBlocErrorFetchState({required this.errorMessage});

//   @override
//   List<Object?> get props => [];
// }

// class OnBoardBlocSuccessFetchState extends OnBoardBlocState {
//   final List<OnBoardData> onBoard;

//   const OnBoardBlocSuccessFetchState({
//     required this.onBoard,
//   });

//   @override
//   List<Object?> get props => [];
// }

// *

abstract class IndexState {
  int? indexin;
}

class IndexinValueState extends IndexState {
  final int index;

  IndexinValueState({this.index = 0});
}
