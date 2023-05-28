import 'package:flutter/material.dart';

class CustomAuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final Widget? prefixIcon;
  final void Function()? onCompleted;
  final TextInputAction? textInputAction;
  final void Function(String value) onChanged;
  final bool readOnly;
  final TextInputType inputType;

  const CustomAuthField(
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
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
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
                        ?  Theme.of(context).errorColor
                        : hasFocus
                            ? Theme.of(context).toggleableActiveColor
                            : Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 6),
                  child: TextField(
                    controller: widget.controller,
                    focusNode: myNode,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: false,
                    readOnly: widget.readOnly,
                    onChanged: widget.onChanged,
                    style: primaryTextTheme.bodyLarge,
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 35, minHeight: 20),
                        // errorText: widget.errorText.isEmpty
                        //     ? null
                        //     : widget.errorText,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right:8.0),
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
                  ),
                ),
              ],
            ),
          ),
          if(widget.errorText.isNotEmpty)
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
