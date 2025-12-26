import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chat_app/modules/home/presentation/cubits/home_cubit/home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitState());

  void changeTabBarIndex(int index) {
    emit(state.copyWith(currentTabBarIndex: index));
  }

  void changeBottomBarIndex(int index) {
    emit(state.copyWith(currentBottomIndex: index));
  }
}
