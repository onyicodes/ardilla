import 'package:flutter/material.dart';

class CashFlowTitle extends StatelessWidget {
  final String flowChange;
  const CashFlowTitle({super.key, required this.flowChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.arrow_drop_up_rounded,
          color: Colors.green,
        ),
        Text("$flowChange%", style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(color: Colors.green, fontWeight: FontWeight.w800),),
        SizedBox(width: 4,),
        Text("CashFlow", style: Theme.of(context).primaryTextTheme.headlineSmall,)
      ],
    );
  }
}
