import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifWidget extends ConsumerWidget {
  const NotifWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBarReception(context),
      body: Column(
        children: const [
          SizedBox(
            height: 15,
          ),
          Text(
            "Demande de suivi",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
