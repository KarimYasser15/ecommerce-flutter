import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/signup_request.dart';
import 'package:ecommerce/features/auth/data/repository/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> login(LoginRequest loginRequest) async {
    emit(AuthLoadingState());
    final result = await _authRepository.login(loginRequest);
    result.fold(
      (_) => emit(AuthSuccessState()),
      (failure) => emit(AuthErrorState(failure.message)),
    );
  }

  Future<void> signUp(SignUpRequest signUpRequest) async {
    emit(AuthLoadingState());
    final result = await _authRepository.signup(signUpRequest);
    result.fold(
      (_) => emit(AuthSuccessState()),
      (failure) => emit(AuthErrorState(failure.message)),
    );
  }
}
