import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/shared/cubit/states.dart';
import 'package:newsapi/shared/network/local/CacheHelper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme({
    bool? fromShared
  }){
    if(fromShared != null){
      isDark = fromShared;
      emit(ChangeThemeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value){
        emit(ChangeThemeState());
      });
    }
  }
}
