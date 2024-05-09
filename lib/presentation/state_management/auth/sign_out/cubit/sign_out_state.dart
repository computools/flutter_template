part of 'sign_out_cubit.dart';

enum SignOutStatus { initial, loading, success, failure }

final class SignOutState extends Equatable {
  const SignOutState({
    this.status = SignOutStatus.initial,
  });

  final SignOutStatus status;

  bool get isLoading => status == SignOutStatus.loading;
  bool get isSuccess => status == SignOutStatus.success;

  SignOutState copyWith({
    SignOutStatus? status,
  }) {
    return SignOutState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
