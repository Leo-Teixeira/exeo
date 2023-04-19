import 'package:exeo/provider/search_provider.dart';
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
                  color: coulBlack,
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
                  // ! adapter avec les valeurs obtenu par l'api
                  setState(() {});
                },
                controller: searchBar,
                style: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
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
                      color: coulGrey,
                    ),
                    // borderRadius: BorderRadius.(),
                  ),
                  hintText: "Ex : Restaurant",
                  hintStyle: const TextStyle(
                    fontFamily: fontHindMaduraiMedium,
                    fontSize: 16,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      width: 1,
                      color: coulGrey,
                    ),
                    // borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelStyle: const TextStyle(
                    color: coulGrey,
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
                        color: coulBlack,
                        fontFamily: fontRubikRegular,
                        fontSize: 28,
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: mode == ListSearch.LIST
                  ? ListView.separated(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                    color: coulBlack,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "../../assets/pictures/bar_chat.png"))),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(35, 72, 35, 0),
                              title: const Text("Cats and Cookies",
                                  style: TextStyle(
                                      color: coulBlack,
                                      fontFamily: fontRubikRegular,
                                      fontSize: 20)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Nous sommes bénévoles et intervenons comme famille d'accueil auprès des chats de la SPAA. Chez Cats and Cookies ils ont des espaces en hauteur, une verrière privative ainsi que l'accès à une cour extérieure qui leur est réservé",
                                    style: TextStyle(
                                        color: coulBlack,
                                        fontFamily: fontHindMaduraiRegular,
                                        fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "12h - 20h",
                                    style: TextStyle(
                                        color: coulBlack,
                                        fontFamily: fontHindMaduraiRegular,
                                        fontSize: 16),
                                  ),
                                ],
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
                      itemCount: 10)
                  : // ! adapter la recherche avec valeur obtenu
                  Container(),
            ),
          ],
        ),
      ),
    );
  }
}
