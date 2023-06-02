import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class CustomPhoneField extends StatefulWidget {
  final PhoneController controller;
  final String hintText;
  final String errorText;
  final Widget? prefixIcon;
  final void Function()? onCompleted;
  final TextInputAction? textInputAction;
  final void Function(PhoneNumber? p)  onChanged;
  final bool readOnly;
  final TextInputType inputType;

  const CustomPhoneField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.onCompleted,
      this.textInputAction,
      this.readOnly = false,
      required this.inputType,
      required this.onChanged,
      required this.errorText})
      : super(key: key);

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  FocusNode myNode = FocusNode();
  bool hasFocus = false;
  Widget? suffixIcon;
  @override
  void initState() {
    super.initState();
    suffixIcon = widget.prefixIcon;
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
                    padding: const EdgeInsets.only(left: 20.0, top: 6),
                    child:

// all params
                        PhoneFormField(
                      key: Key('phone-field'),
                      controller: widget.controller, // controller & initialValue value
                      initialValue: null, // can't be supplied simultaneously
                      shouldFormat: true, // default
                      defaultCountry: IsoCode.NG, // default
                      decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 35, minHeight: 20),
                          // errorText: widget.errorText.isEmpty
                          //     ? null
                          //     : widget.errorText,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: widget.prefixIcon,
                          ),
                          hintText: widget.hintText,
                          hintStyle: primaryTextTheme.bodyLarge!
                              .copyWith(color: Theme.of(context).hintColor),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 4.0, top: 4.0, bottom: 4.0, right: 4.0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      validator: PhoneValidator.none, // default PhoneValidator.valid()
                      isCountryChipPersistent: false, // default
                      isCountrySelectionEnabled: true, // default
                      countrySelectorNavigator:
                          CountrySelectorNavigator.bottomSheet(),
                      showFlagInInput: true, // default
                      flagSize: 16, // default
                      autofillHints: [
                        AutofillHints.telephoneNumber
                      ], // default to null
                      enabled: true, // default
                      autofocus: false, // default
                      onSaved: (PhoneNumber? p) {
                        print('saved $p');
                      }, // default null
                      onChanged:widget.onChanged, // default null
                      // ... + other textfield params
                    )),
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
            )
        ],
      ),
    );
  }
}
