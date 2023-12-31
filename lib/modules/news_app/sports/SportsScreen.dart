import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/layout/news_app/cubit/cubit.dart';
import 'package:newsapi/layout/news_app/cubit/states.dart';
import 'package:newsapi/shared/components/components.dart';


class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return buildNewsAppPage(list, context);
      },
    );
  }
}
