import 'package:ai_medicare/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class generalCubit extends Cubit<generarStates> {
  generalCubit() : super(generalInitialState());
  static generalCubit get(context) => BlocProvider.of(context);
}
