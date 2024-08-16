
import 'package:signals/signals.dart';

enum SideBarState {
  selected,
  focused,
  hovered,
  pressed,
  disabled,
}

class ShadStatesController {
  final Signal<Set<SideBarState>> stateSignal;

  ShadStatesController([Set<SideBarState>? initialState])
      : stateSignal = Signal(<SideBarState>{...?initialState});

  void update(SideBarState state, bool add) {
    final currentState = stateSignal.value;
    final valueChanged = add ? currentState.add(state) : currentState.remove(state);

    if (valueChanged) {
      stateSignal.value = {...currentState};
    }
  }
}