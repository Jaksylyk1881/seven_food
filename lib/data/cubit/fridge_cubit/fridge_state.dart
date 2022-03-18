
part of 'fridge_cubit.dart';

abstract class FridgeState{}

class FridgeInitialState extends FridgeState{}
class FridgeLoadingState extends FridgeState{}
class FridgeOpenedState extends FridgeState{
  FridgeOpened fridgeOpened;
  FridgeOpenedState(this.fridgeOpened);
}
class FridgeChangedState extends FridgeState{
  FridgeOpened? fridgeOpened;
  FridgeChanged fridgeChanged;
  FridgeChangedState(this.fridgeOpened,this.fridgeChanged);
}
class FridgeClosedState extends FridgeState{
  FridgeClosed fridgeClosed;
  FridgeClosedState(this.fridgeClosed);
}
