part of 'qr_cubit.dart';


abstract class QrState{}

class QrStateInitial extends QrState{}
class QrStateLoading extends QrState{}
class QrStateLoaded extends QrState{
  int orderID;
  QrStateLoaded(this.orderID);
}
class QrStateError extends QrState{
  String message;
  QrStateError(this.message);
}
