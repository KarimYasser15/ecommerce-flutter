import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/sign_up.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  final Login _login;
  final SignUp _signUp;
  AuthCubit(
    this._login,
    this._signUp,
  ) : super(AuthInitialState());

  Future<void> login(LoginRequest loginRequest) async {
    emit(AuthLoadingState());
    final result = await _login(loginRequest);
    result.fold(
      (_) => emit(AuthSuccessState()),
      (failure) => emit(AuthErrorState(failure.message)),
    );
  }

  Future<void> signUp(SignUpRequest signUpRequest) async {
    emit(AuthLoadingState());
    final result = await _signUp(signUpRequest);
    result.fold(
      (_) => emit(AuthSuccessState()),
      (failure) => emit(AuthErrorState(failure.message)),
    );
  }
}
