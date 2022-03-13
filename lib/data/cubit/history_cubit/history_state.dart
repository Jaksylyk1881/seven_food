part of 'history_cubit.dart';


abstract class HistoryState{}

class HistoryStateInitial extends HistoryState{}
class HistoryStateLoading extends HistoryState{}
class HistoryStateLoaded extends HistoryState{
  List<HistoryMain> histories;
  HistoryStateLoaded(this.histories);
}
class HistoryStateError extends HistoryState{
  String message;
  HistoryStateError(this.message);
}
