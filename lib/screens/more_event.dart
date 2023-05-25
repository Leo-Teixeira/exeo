import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/event_provider.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_info.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreEvent extends ConsumerWidget {
  const MoreEvent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TypeListReception type =
        ref.watch(typeListReceptionProviderState.notifier).state;
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
          type == TypeListReception.EVENEMENT
              ? getListEvents(context, ref)
              : getListActivity(context, ref)
        ]),
      ),
    );
  }
}

Widget getListEvents(BuildContext context, WidgetRef ref) {
  AsyncValue<List<Events>> listEvents = ref.watch(getEvenementsLimit(100));
  return listEvents.when(data: (events) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .watch(typeInfoStateProvider.notifier)
                        .update((state) => TypeInfo.EVENEMENT);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MoreInfoWidget(
                          info_event: events[index],
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      image: const DecorationImage(
                          image: AssetImage("assets/pictures/bar_chat.png"),
                          fit: BoxFit.cover),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(35, 72, 35, 0),
                      title: Text(events[index].title,
                          style: const TextStyle(
                              color: coulWhite,
                              fontFamily: fontRubikRegular,
                              fontSize: 20)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            events[index].description,
                            style: const TextStyle(
                                color: coulWhite,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          ),
                          Text(
                            events[index].start_date,
                            style: const TextStyle(
                                color: coulWhite,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 16),
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
            itemCount: events.length));
  }, error: (err, stack) {
    return Center(child: Text(stack.toString()));
  }, loading: () {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}

Widget getListActivity(BuildContext context, WidgetRef ref) {
  AsyncValue<List<Events>> listActivity =
      ref.watch(getEventCategoryProvider("jeux"));
  return listActivity.when(data: (activity) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .watch(typeInfoStateProvider.notifier)
                        .update((state) => TypeInfo.EVENEMENT);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MoreInfoWidget(
                          info_event: activity[index],
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      image: const DecorationImage(
                          image: AssetImage("assets/pictures/bar_chat.png"),
                          fit: BoxFit.cover),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(35, 72, 35, 0),
                      title: Text(activity[index].title,
                          style: const TextStyle(
                              color: coulWhite,
                              fontFamily: fontRubikRegular,
                              fontSize: 20)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity[index].description,
                            style: const TextStyle(
                                color: coulWhite,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          ),
                          Text(
                            activity[index].start_date,
                            style: const TextStyle(
                                color: coulWhite,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 16),
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
            itemCount: activity.length));
  }, error: (err, stack) {
    return Center(child: Text(stack.toString()));
  }, loading: () {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}
