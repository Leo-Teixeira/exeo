import 'package:exeo/models/category_model.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreActivities extends ConsumerWidget {
  const MoreActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Category>> listCategory = ref.watch(getActivite);
    return Scaffold(
        backgroundColor: coulBlack,
        appBar: appBarReception(context),
        body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("./assets/pictures/real_background.png"),
                  fit: BoxFit.cover),
            ),
            child: listCategory.when(data: (category) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container();
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  itemCount: category.length);
            }, error: (err, stack) {
              return Text("probleme" + err.toString());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            })));
  }
}
