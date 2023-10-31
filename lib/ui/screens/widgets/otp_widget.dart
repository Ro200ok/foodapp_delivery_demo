import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_bloc.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_event.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget(
      {Key? key, required this.codeController, required this.verificationId})
      : super(key: key);
  final TextEditingController codeController;
  final String verificationId;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey();

  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Введите код из sms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          OTPTextField(
            onChanged: (pin) {},
            onCompleted: (val) {
              setState(() {
                otpCode = val;
                log(otpCode);
              });
            },
            fieldStyle: FieldStyle.box,
            width: MediaQuery.of(context).size.width,
            length: 6,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: otpCode != ''
                  ? () {
                      if (_otpFormKey.currentState!.validate()) {
                        _verifyOtp(context: context, otpCode: otpCode);
                      }
                    }
                  : null,
              child: const Text('Продолжить'),
            ),
          ),
        ],
      ),
    );
  }

  void _verifyOtp({required BuildContext context, required String otpCode}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
        otpCode: otpCode, verificationId: widget.verificationId));
    widget.codeController.clear();
  }
}
