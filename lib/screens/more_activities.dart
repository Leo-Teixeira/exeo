import 'package:exeo/models/category_model.dart';
import 'package:exeo/provider/event_provider.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_event.dart';
import 'package:exeo/screens/more_user.dart';
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
        child: Column(children: [
          titlePage(context),
          listCategory.when(
            data: (category) {
              return Expanded(
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .watch(
                                      typeListReceptionProviderState.notifier)
                                  .update(
                                      (state) => TypeListReception.ACTIVITE);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MoreEvent(
                                    category: category[index].name,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                    color: coulBlack,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mdp01.mdstestangers.fr${category[index].content!}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(35, 72, 35, 0),
                                title: Text(category[index].name,
                                    style: const TextStyle(
                                        color: coulWhite,
                                        fontFamily: fontRubikRegular,
                                        fontSize: 20)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      category[index].description ??
                                          "Pas de description",
                                      style: const TextStyle(
                                          color: coulWhite,
                                          fontFamily: fontHindMaduraiRegular,
                                          fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      }),
                      itemCount: category.length));
            },
            error: (err, stack) {
              return Text("probleme" + err.toString());
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          )
        ]),
      ),
    );
  }
}
