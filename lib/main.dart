import 'package:flutter/material.dart';

import 'injection.dart';
import 'presentation/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<SurahBloc>()),
        BlocProvider(create: (context) => locator<SholatBloc>()),
        BlocProvider(create: (context) => locator<LastReadBloc>()),
        BlocProvider(create: (context) => locator<HaditsBloc>()),
        BlocProvider(create: (context) => locator<DoaBloc>()),
        BlocProvider(create: (context) => locator<BookmarkBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(),
      ),
    );
  }
}
