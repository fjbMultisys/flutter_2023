import 'package:flutter/material.dart';

enum MpinStyle {
  filled,
  bordered,
}

extension MpinStyleExtension on MpinStyle {
  Color getBackgroundColor() {
    switch (this) {
      case MpinStyle.filled:
        return Colors.white;
      default:
        return Colors.transparent;
    }
  }

  Color getForegroundColor() {
    switch (this) {
      case MpinStyle.filled:
        return Colors.black;
      default:
        return const Color.fromARGB(255, 153, 204, 102);
    }
  }
}

class AppMpinInputView extends StatefulWidget {
  final MpinStyle style;
  final int fieldCount;
  final bool obscureText;
  final Function(String) onCompleted;

  const AppMpinInputView(
      {Key? key,
      required this.style,
      required this.fieldCount,
      required this.obscureText,
      required this.onCompleted})
      : super(key: key);

  @override
  State<AppMpinInputView> createState() => _AppMpinInputViewState();
}

class _AppMpinInputViewState extends State<AppMpinInputView> {
  final List<TextEditingController> _controllers = [];
  final List<Widget> _fieldViews = [];

  Widget _fieldView(
      {required int index,
      required bool autofocus,
      required TextEditingController controller}) {
    final outlineBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: widget.style == MpinStyle.filled
                ? Colors.white
                : Colors.grey.shade400));

    return SizedBox(
      width: 50,
      child: TextField(
        autofocus: autofocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.style.getBackgroundColor(),
            border: outlineBorder,
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
            contentPadding: const EdgeInsets.only(top: 25, bottom: 25),
            counterText: ''),
        style: TextStyle(
            color: widget.style.getForegroundColor(),
            fontSize: 23.0,
            fontWeight: FontWeight.w700),
        onChanged: (value) {
          if (value.length == 1) {
            if (index != widget.fieldCount - 1) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
              final values = _controllers.map((e) => e.text).join();
              widget.onCompleted(values);
            }
          } else {
            if (index != 0) FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero, () {
    //   for (var i = 0; i < widget.fieldCount; i++) {
    //     _controllers.add(TextEditingController());
    //   }

    //   for (var controller in _controllers) {
    //     _fieldViews.add(_fieldView(autofocus: false, controller: controller));
    //   }
    // });
    for (var i = 0; i < widget.fieldCount; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_fieldViews.isEmpty) {
      for (var i = 0; i < _controllers.length; i++) {
        _fieldViews.add(_fieldView(
            index: i, autofocus: i == 0, controller: _controllers[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _fieldViews,
    );
  }
}
