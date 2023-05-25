import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/event_provider.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/provider/search_provider.dart';
import 'package:exeo/screens/more_info.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! pouvoir également rechercher un utilisateur depuis cette interface

class SearchPageWidget extends ConsumerStatefulWidget {
  const SearchPageWidget({super.key});

  @override
  ConsumerState<SearchPageWidget> createState() => SearchPage();
}

class SearchPage extends ConsumerState<SearchPageWidget> {
  TextEditingController searchBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Events> listSearchEvent = [];
    ListSearch mode = ref.watch(listModePorvider);
    return Scaffold(
      backgroundColor: coulBlack,
      appBar: appBarReception(context),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/pictures/real_background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text(
                "Entrez votre recherche",
                style: TextStyle(
                  color: coulWhite,
                  fontFamily: fontRubikRegular,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    ref
                        .watch(listSearchProviderState.notifier)
                        .update((state) => ListSearch.LIST);
                  } else {
                    ref
                        .watch(listSearchProviderState.notifier)
                        .update((state) => ListSearch.SEARCH);
                  }
                  ref
                      .watch(searchEventProvider.notifier)
                      .filterSearchEvent(value);
                },
                controller: ref.watch(searchControllerProvider),
                style: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                  color: coulWhiteGrey,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: coulCiel,
                  ),
                  suffixIcon: mode == ListSearch.SEARCH
                      ? IconButton(
                          onPressed: () {
                            searchBar.clear();
                            ref
                                .watch(listSearchProviderState.notifier)
                                .update((state) => ListSearch.LIST);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: coulCiel,
                            size: 20,
                          ),
                        )
                      : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      width: 1,
                      color: coulWhiteGrey,
                    ),
                    // borderRadius: BorderRadius.(),
                  ),
                  hintText: "Ex : Restaurant",
                  hintStyle: const TextStyle(
                      fontFamily: fontHindMaduraiMedium,
                      fontSize: 16,
                      color: coulWhiteGrey),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      width: 1,
                      color: coulWhiteGrey,
                    ),
                    // borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelStyle: const TextStyle(
                    color: coulWhiteGrey,
                    fontFamily: fontHindMaduraiMedium,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: mode == ListSearch.LIST
                  ? const Text(
                      "Nos suggestions",
                      style: TextStyle(
                        color: coulWhite,
                        fontFamily: fontRubikRegular,
                        fontSize: 28,
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 18,
            ),
            mode == ListSearch.LIST
                ? infoEvent(ref, mode)
                : infoEventSearch(ref, mode)
          ],
        ),
      ),
    );
  }
}

Widget infoEvent(WidgetRef ref, ListSearch mode) {
  AsyncValue<List<Events>> listEvents = ref.watch(getEvenementsLimit(30));
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
                        .update((state) => TypeInfo.LIEU);
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

Widget infoEventSearch(WidgetRef ref, ListSearch mode) {
  AsyncValue<List<Events>> listEventsSearch = ref.watch(
      getEventByTitleProvider(ref.watch(searchEventProvider.notifier).state));
  return listEventsSearch.when(data: (listEvents) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .watch(typeInfoStateProvider.notifier)
                        .update((state) => TypeInfo.LIEU);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MoreInfoWidget(
                          info_event: listEvents[index],
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
                      title: Text(listEvents[index].title,
                          style: const TextStyle(
                              color: coulWhite,
                              fontFamily: fontRubikRegular,
                              fontSize: 20)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listEvents[index].description,
                            style: const TextStyle(
                                color: coulWhite,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          ),
                          Text(
                            listEvents[index].start_date,
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
            itemCount: listEvents.length));
  }, error: (err, stack) {
    return Center(child: Text(stack.toString()));
  }, loading: () {
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}
