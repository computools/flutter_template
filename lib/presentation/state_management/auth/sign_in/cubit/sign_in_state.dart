part of 'sign_in_cubit.dart';

enum SignInStatus { initial, loading, success, failure }

final class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
  });

  final SignInStatus status;

  bool get isLoading => status == SignInStatus.loading;
  bool get isSuccess => status == SignInStatus.success;

  SignInState copyWith({
    SignInStatus? status,
  }) {
    return SignInState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
