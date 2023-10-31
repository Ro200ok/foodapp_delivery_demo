import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_event.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_state.dart';

import 'package:food_app_test/repositories/phone_auth_repository.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthRepository phoneAuthRepository;
  final auth = FirebaseAuth.instance;
  PhoneAuthBloc({required this.phoneAuthRepository})
      : super(PhoneAuthInitial()) {
    /// Событие нажатия кнопки отправить otp
    on<SendOtpToPhoneEvent>(_onSendOtp);

    /// После получения otp, когда пользователь нажимает кнопку проверки otp
    on<VerifySentOtpEvent>(_onVerifyOtp);

    /// Когда Firebase отправит код на телефон пользователя
    on<OnPhoneOtpSent>((event, emit) =>
        emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    ///Когда при отправке otp на телефон пользователя возникает какая-либо ошибка
    on<OnPhoneAuthErrorEvent>(
        (event, emit) => emit(PhoneAuthError(error: event.error)));

    ///успешная верификация и вход в систему
    on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);
  }

  FutureOr<void> _onSendOtp(
      SendOtpToPhoneEvent event, Emitter<PhoneAuthState> emit) async {
    emit(PhoneAuthLoading());
    try {
      await phoneAuthRepository.verifyPhone(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          ///В [verificationComplete] мы получим учетные данные от Firebase и отправим их в событие [OnPhoneAuthVerificationCompleteEvent],
          /// которое будет обработано блоком, а затем выдадим состояние [PhoneAuthVerified] после успешного входа в систему.
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        codeSent: (String verificationId, int? resendToken) {
          ///В [codeSent] мы получим верификацию и resendToken из Firebase и отправим их в событие [OnPhoneOtpSent],
          /// которое будет обработано блоком, а затем отправим событие [OnPhoneAuthVerificationCompleteEvent]
          /// после получения кода с телефона пользователя.
          add(OnPhoneOtpSent(
              verificationId: verificationId, token: resendToken));
        },
        verificationFailed: (FirebaseAuthException e) {
          /// В случае [verificationFailed] мы получим исключение из Firebase и отправим его в событие [OnPhoneAuthErrorEvent],
          /// которое будет обработано блоком, а затем выдадим состояние [PhoneAuthError], чтобы отобразить ошибку на экране пользователя.
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifySentOtpEvent event, Emitter<PhoneAuthState> emit) async {
    try {
      emit(PhoneAuthLoading());

      /// После получения otp мы проверим otp, затем создадим учетные данные из otp и VerificationId,
      /// а затем отправим их в событие [OnPhoneAuthVerificationCompleteEvent],
      /// которое будет обработано блоком, а затем выдадим состояние [PhoneAuthVerified] после успешного входа в систему.
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _loginWithCredential(
      OnPhoneAuthVerificationCompleteEvent event,
      Emitter<PhoneAuthState> emit) async {
    /// После получения учетных данных от события мы войдем в систему с учетными данными,
    /// а затем выдадим состояние [PhoneAuthVerified] после успешного входа в систему.
    try {
      await auth.signInWithCredential(event.credential).then((user) {
        if (user.user != null) {
          emit(PhoneAuthVerified());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(error: e.code));
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }
}
