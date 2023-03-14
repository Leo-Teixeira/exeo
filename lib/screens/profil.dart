import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ProfilWidget extends ConsumerWidget {
  const ProfilWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarReception(context),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("JohnDoe_"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("John Doe"),
                  Row(
                    children: const [
                      Text("108"),
                      Icon(Icons.person),
                      Text("Amis"),
                    ],
                  )
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.abc,
                        color: coulBlack,
                      ),
                      Text(
                        "Evenements",
                        style: TextStyle(color: coulBlack),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.abc,
                        color: coulBlack,
                      ),
                      Text(
                        "Swipe",
                        style: TextStyle(color: coulBlack),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  listEvenementLike(),
                  listSwipeLike(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget listEvenementLike() {
  return ListView.separated(
      padding: EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: coulBlack, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ListTile(
            onTap: () {},
            leading: Image.asset("assets/pictures/test.jpeg"),
            title: const Text(
              "Event name",
              style: TextStyle(
                fontFamily: fontHindMaduraiRegular,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              "Description",
              style: TextStyle(
                fontFamily: fontHindMaduraiRegular,
                fontSize: 12,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesome5.bookmark),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10);
}

Widget listSwipeLike() {
  return ListView.separated(
      padding: EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: coulBlack, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ListTile(
            onTap: () {},
            leading: Image.asset("assets/pictures/test.jpeg"),
            title: const Text(
              "Event name",
              style: TextStyle(
                fontFamily: fontHindMaduraiRegular,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              "Description",
              style: TextStyle(
                fontFamily: fontHindMaduraiRegular,
                fontSize: 12,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesome5.bookmark),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10);
}
