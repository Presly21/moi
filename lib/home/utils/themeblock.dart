import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeEnum { Light, Dark }

class ThemeState {
  final ThemeData themeData;
  final ThemeModeEnum themeMode;

  ThemeState({required this.themeData, required this.themeMode});
}

class ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light(), themeMode: ThemeModeEnum.Light));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    ThemeModeEnum newThemeMode =
        state.themeMode == ThemeModeEnum.Light ? ThemeModeEnum.Dark : ThemeModeEnum.Light;
    yield ThemeState(
      themeData:
          newThemeMode == ThemeModeEnum.Dark ? ThemeData.dark() : ThemeData.light(),
      themeMode: newThemeMode,
    );
  }
}