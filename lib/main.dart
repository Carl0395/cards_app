import 'package:cards_app/core/dependency_injection.dart';
import 'package:cards_app/core/route_generator.dart';
import 'package:cards_app/core/routes.dart';
import 'package:cards_app/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => GetIt.I<CardsBloc>())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade100),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF1E51FE),
          ),
        ),
        initialRoute: Routes.cardList,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
