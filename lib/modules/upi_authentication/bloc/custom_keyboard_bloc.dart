import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'custom_keyboard_event.dart';
part 'custom_keyboard_state.dart';

class CustomKeyboardBloc
    extends Bloc<CustomKeyboardEvent, CustomKeyboardState> {
  CustomKeyboardBloc() : super(InitialKeyState()) {
    on<DigitEvent>((event, emit) {
      switch (event.digit) {
        case "1":
          emit(Key1());
          break;
        case "2":
          emit(Key2());
          break;
        case "3":
          emit(Key3());
          break;
        case "4":
          emit(Key4());
          break;
        case "5":
          emit(Key5());
          break;
        case "6":
          emit(Key6());
          break;
        case "7":
          emit(Key7());
          break;
        case "8":
          emit(Key8());
          break;
        case "9":
          emit(Key9());
          break;
        case "0":
          emit(Key0());
          break;
        default:
      }
    });
    on<ActionEvent>((event, emit) {
      if (event.action == "erase") {
        emit(EraseState(event.action));
      } else if (event.action == "submit") {
        emit(SubmitState(event.action));
      }
    });
  }
}
