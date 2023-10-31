import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_bloc.dart';
import 'package:food_app_test/blocs/phone_auth/phone_auth_state.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:food_app_test/ui/screens/widgets/otp_widget.dart';
import 'package:food_app_test/ui/screens/widgets/phone_number_field.dart';
import 'package:go_router/go_router.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _codeController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _codeController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          if (state is PhoneAuthVerified) {
            context.go(AppPaths.authSuccess);
          }

          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
          builder: (context, state) {
            if (state is PhoneAuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is! PhoneAuthCodeSentSuccess)
                    Column(
                      children: [
                        const Text(
                          "Введите номер телефона",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Отправим код подтверждения",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          height: 30,
                          endIndent: 20,
                          indent: 20,
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PhoneNumberWidget(
                          phoneNumberController: _phoneNumberController,
                        )
                      ],
                    )
                  else
                    OtpWidget(
                      codeController: _codeController,
                      verificationId: state.verificationId,
                    ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
