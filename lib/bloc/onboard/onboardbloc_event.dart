// import 'package:equatable/equatable.dart';

// *important this template event for bloc_event

// abstract class OnBoardBlocEvent extends Equatable {
//   const OnBoardBlocEvent();
// }

// class FetchDataEvent extends OnBoardBlocEvent {
//   @override
//   List<Object?> get props => [];
// }

// *

abstract class IndexinEvent {}

class ReIndexEvent extends IndexinEvent {
  final int index;

  ReIndexEvent(this.index);
}
