import 'package:flutter/material.dart';
import 'package:cauayan_flutter/widgets/AppMpinView/app_mpin_input_view.dart';

class AppOtpView extends StatefulWidget {
  final String mobileNumber;
  final ValueSetter<String> onCompletedOtp;
  final VoidCallback onResendCode;

  const AppOtpView({super.key, required this.mobileNumber, required this.onCompletedOtp, required this.onResendCode});

  @override
  State<AppOtpView> createState() => _AppOtpViewState();
}

class _AppOtpViewState extends State<AppOtpView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Column(children: [
              Image.asset("assets/images/icons/enter-otp-icon.png", width: 70),
              const SizedBox(height: 20),
              const Text(
                'A verification code has been sent to +63 **********. It will expire in 5:00 minutes.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
            ]),
            const SizedBox(height: 30),
            AppMpinInputView(
              style: MpinStyle.bordered,
              fieldCount: 6,
              obscureText: false,
              onCompleted: (otp) => widget.onCompletedOtp(otp),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn’t receive a code?",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: widget.onResendCode,
                    child: const Text('Resend Code',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color.fromARGB(255, 153, 204, 102))))
              ],
            )
          ],
        )
      ],
    );
  }
}
