import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitState());

//-----------------------------Constructor-----------------------------//

  static AuthCubit GET(context) => BlocProvider.of(context);
  //----------------------------Variables------------------------------//
  var SignupEmail = TextEditingController();
  var SignupEnglishName = TextEditingController();
  var SignupArabicName = TextEditingController();
  var SignupPhone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var SignupPassword = TextEditingController();
  var SignupConfirmPassword = TextEditingController();
  bool isPass = true;
  bool isPassConfirm = true;
  //-----------------------------Methods---------------------------//
  void ChangePassShow() {
    isPass = !isPass;
    emit(ChangePassShowState());
  }

  void ChangePassConfirmShow() {
    isPassConfirm = !isPassConfirm;
    emit(ChangePassShowState());
  }
}
