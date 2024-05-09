import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/auth/entities/auth_payload.dart';
import 'package:flutter_template/domain/auth/usecase/sign_in_with.usecase.dart';
import 'package:flutter_template/routing/app_router.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInWithUsecase _signInWithUsecase;
  final AppRouter _router;

  SignInCubit(
    this._signInWithUsecase,
    this._router,
  ) : super(const SignInState());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    if (state.isLoading) return;
    emit(state.copyWith(
      status: SignInStatus.loading,
    ));

    try {
      await _signInWithUsecase(EmailSignIn(email, password));
      if (!isClosed) {
        emit(state.copyWith(
          status: SignInStatus.success,
        ));
        _router.replaceAll([const ProductsRoute()]);
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          status: SignInStatus.failure,
        ));
        addError(e);
      }
    }
  }
}
