part of 'custom_keyboard_bloc.dart';

abstract class CustomKeyboardState extends Equatable {
  final String value;
  final DateTime updatedAt;
  const CustomKeyboardState(this.value, this.updatedAt);

  @override
  List<Object> get props => [value, updatedAt];
}

class InitialKeyState extends CustomKeyboardState {
  InitialKeyState() : super("", DateTime.now());
}

class Key1 extends CustomKeyboardState {
  Key1() : super("1", DateTime.now());
}

class Key2 extends CustomKeyboardState {
  Key2() : super("2", DateTime.now());
}

class Key3 extends CustomKeyboardState {
  Key3() : super("3", DateTime.now());
}

class Key4 extends CustomKeyboardState {
  Key4() : super("4", DateTime.now());
}

class Key5 extends CustomKeyboardState {
  Key5() : super("5", DateTime.now());
}

class Key6 extends CustomKeyboardState {
  Key6() : super("6", DateTime.now());
}

class Key7 extends CustomKeyboardState {
  Key7() : super("7", DateTime.now());
}

class Key8 extends CustomKeyboardState {
  Key8() : super("8", DateTime.now());
}

class Key9 extends CustomKeyboardState {
  Key9() : super("9", DateTime.now());
}

class Key0 extends CustomKeyboardState {
  Key0() : super("0", DateTime.now());
}

class EraseState extends CustomKeyboardState {
  EraseState(String value) : super(value, DateTime.now());
}

class SubmitState extends CustomKeyboardState {
  SubmitState(String value) : super(value, DateTime.now());
}
