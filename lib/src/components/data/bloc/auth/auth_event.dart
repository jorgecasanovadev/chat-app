part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent({
    this.isLoading,
    this.isAuthorized,
    this.displayUIState,
  });
  final bool? isLoading;
  final bool? isAuthorized;
  final AuthUIState? displayUIState;

  @override
  List<Object> get props => [];
}

class OnForceLogoutEvent extends AuthEvent {
  const OnForceLogoutEvent();
}

class OnInitAuthEvent extends AuthEvent {
  const OnInitAuthEvent();
}
