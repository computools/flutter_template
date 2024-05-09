
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/auth/usecase/sign_out.usecase.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_template/routing/app_router.dart';

part 'sign_out_state.dart';

@injectable
class SignOutCubit extends Cubit<SignOutState> {
  final AppRouter _router;
  final SignOutUsecase _signOutUsecase;

  SignOutCubit(
    this._signOutUsecase,
    this._router,
  ) : super(const SignOutState());

  Future<void> signOut() async {
    emit(state.copyWith(
      status: SignOutStatus.loading,
    ));

    try {
      await _signOutUsecase();
      emit(state.copyWith(
        status: SignOutStatus.success,
      ));
      _router.replaceAll([const SignInRoute()]);
    } catch (e) {
      emit(state.copyWith(
        status: SignOutStatus.failure,
      ));
      addError(e);
    }
  }
}
