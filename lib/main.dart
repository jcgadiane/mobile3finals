import 'package:bloc_finals_exam/blocs/bloc.exports.dart';
import 'package:bloc_finals_exam/blocs/bloc/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'app_themes.dart';
import 'screens/tabs_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MyApp(appRouter: AppRouter())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
        return MaterialApp(
          title: 'BloC Tasks App',
          theme: state.switchValue
              ? AppThemes.appThemeData[AppTheme.darkMode]
              : AppThemes.appThemeData[AppTheme.lightMode],
          home: const TabsScreen(),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      }),
    );
  }
}
