import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreEvent extends ConsumerWidget {
  const MoreEvent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: appBarReception(context),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container();
            },
            separatorBuilder: (context, index) {
              return Container();
            },
            itemCount: 10));
  }
}
