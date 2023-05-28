import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final bool readOnly;
  final Widget prefixIcon;
  final Widget validationWidget;
  final void Function(String value) onChanged;
  final void Function() toggleObscureText;
  final bool obscurePassword;

  const PasswordTextField(
      {Key? key,
      required this.controller,
      required this.errorText,
      required this.prefixIcon,
      this.readOnly = false,
      required this.obscurePassword,
      required this.toggleObscureText,
      required this.onChanged,
      this.hintText = "• • • • • • • • • ",
      this.validationWidget = const SizedBox()})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  FocusNode myNode = FocusNode();
  bool hasFocus = false;
  @override
  void initState() {
    super.initState();
    myNode.addListener(() {
      setState(() {
        hasFocus = myNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    myNode.removeListener(() {});
    myNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GestureDetector(
      onTap: () {
        myNode.requestFocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.errorText.isNotEmpty
                        ? Theme.of(context).errorColor
                        : hasFocus
                            ? Theme.of(context).toggleableActiveColor
                            : Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 6.0),
                  child: TextField(
                    focusNode: myNode,
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    readOnly: widget.readOnly,
                    obscureText: widget.obscurePassword ? true : false,
                    style: primaryTextTheme.bodyLarge,
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 30, minHeight: 0),
                        suffixIcon: IconButton(
                            onPressed: widget.toggleObscureText,
                            icon:  Icon(!widget.obscurePassword
                                ?Icons.visibility_outlined
                         : Icons.visibility_off_outlined) ),
                        //errorText: widget.errorText.isEmpty ? null : widget.errorText,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: widget.prefixIcon,
                        ),
                        hintText: widget.hintText,
                        hintStyle: primaryTextTheme.bodyLarge,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.only(
                            left: 4.0, top: 4.0, bottom: 4.0, right: 4.0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                ),
              ],
            ),
          ),
          if (widget.errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.errorText,
                style: primaryTextTheme.bodyMedium!
                    .copyWith(color: Theme.of(context).errorColor),
              ),
            ),
          widget.validationWidget
        ],
      ),
    );
  }
}
