import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit(): super(1);

  updateNext(){
    emit(state +1);
  }
  updatePrevius(){
    emit( state - 1);
  }
  
}