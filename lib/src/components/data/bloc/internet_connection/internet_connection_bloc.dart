import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vca_chat/src/modules/utils/toast.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(const InternetConnectionState()) {
    on<InternetConnectionEvent>((event, emit) {});

    //
    on<OnInitInternetConnectionEvent>((event, emit) {
      emit(
        state.copyWith(
          isInitialized: true,
          isActive: event.isActive,
        ),
      );
    });

    //
    on<OnActivateInternetConnectionEvent>((event, emit) {
      emit(
        state.copyWith(
          isActive: true,
        ),
      );
    });

    //
    on<OnDeactivateInternetConnectionEvent>((event, emit) {
      emit(
        state.copyWith(
          isActive: false,
        ),
      );
    });
    _init();
  }
  StreamSubscription<dynamic>? listener;

  Future<void> _init() async {
    final result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      unawaited(
        ToastMessages.showToast('internetConnection.toast.notConnected'.tr()),
      );
    }
    add(OnInitInternetConnectionEvent(isActive: result));

    listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          if (state.isActive != true && state.isInitialized == true) {
            ToastMessages.showToast(
              'internetConnection.toast.connected'.tr(),
            );
            add(OnActivateInternetConnectionEvent());
          }
        case InternetConnectionStatus.disconnected:
          if (state.isActive != false && state.isInitialized == true) {
            ToastMessages.showToast(
              'internetConnection.toast.notConnected'.tr(),
            );
            add(OnDeactivateInternetConnectionEvent());
          }
      }
    });
  }

  @override
  Future<void> close() {
    listener?.cancel();
    return super.close();
  }
}
