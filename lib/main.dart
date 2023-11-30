import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/layout/news_app/NewsLayout.dart';
import 'package:newsapi/layout/news_app/cubit/cubit.dart';
import 'package:newsapi/layout/news_app/cubit/states.dart';
import 'package:newsapi/shared/bloc_observer.dart';
import 'package:newsapi/shared/network/local/CacheHelper.dart';
import 'package:newsapi/shared/network/remote/dio_helper.dart';
import 'package:newsapi/shared/styles/themes.dart';


void main() async {
  // ensure that everything in main method has finished then run MyApp.
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.get(key: 'isDark') ?? false;

  return runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..changeTheme()..getBusiness(),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
