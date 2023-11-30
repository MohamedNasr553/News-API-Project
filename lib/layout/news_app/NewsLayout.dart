import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/layout/news_app/cubit/cubit.dart';
import 'package:newsapi/layout/news_app/cubit/states.dart';
import 'package:newsapi/modules/news_app/search/SearchScreen.dart';
import 'package:newsapi/shared/components/components.dart';
import 'package:newsapi/shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubitObj = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.menu,
              ),
            ),
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, const SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
                iconSize: 30.0,
              ),
              IconButton(
                onPressed: (){
                  NewsCubit.get(context).changeTheme();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
                iconSize: 30.0,
              )
            ],
          ),
          body: cubitObj.screens[cubitObj.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubitObj.currentIndex,
            onTap: (int index){
              cubitObj.changeBottomNavBar(index);
            },
            items: cubitObj.bottomItems,
          ),
        );
      },
    );
  }
}
