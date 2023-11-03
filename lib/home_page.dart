import 'package:flutter/material.dart';
import 'package:youvibe/features/fetching/presentation/pages/fetch_page.dart';
import 'package:youvibe/features/playing/presentation/pages/player_view.dart';
import 'package:youvibe/utils/utils.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(" YouVibe"),
        titleSpacing: 25,
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        actions: const [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.add),
          //     style: IconButton.styleFrom(
          //       backgroundColor: const Color(0xffa0e9ff),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: const Column(
        children: [
          HomePlayListSection(),
          HomeSongsListSection(),
        ],
      ),
      bottomNavigationBar: const HomeMusicPlaySection(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toFetchPage(context);
        },
        backgroundColor: const Color(0xffa0e9ff),
        child: const Icon(Icons.add),
      ),
    );
  }

  void toFetchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FetchPage(),
      ),
    );
  }

}

/////////////////////////////////////////////////////////////
class HomeMusicPlaySection extends StatelessWidget {
  const HomeMusicPlaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
        color: Color(0xffa0e9ff),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayerView(),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundColor: MyUtils.randomColor(),
          ),
          title: const Text("Currently Playing Song Name"),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          subtitle: const Text("subtitle"),
          subtitleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow_outlined,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
class HomePlayListSection extends StatelessWidget {
  const HomePlayListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RotatedBox(
              quarterTurns: -1,
              child: Text(
                "PlayList's  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: MyUtils.myPlayList.length,
                  itemBuilder: (c, i) {
                    return SizedBox(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    MyUtils.myPlayList[i],
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 15,
                              left: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 10,
                              child: IconButton.filled(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (c, i) {
                    return const SizedBox(width: 20);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
class HomeSongsListSection extends StatelessWidget {
  const HomeSongsListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: RotatedBox(
                quarterTurns: -1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Like's",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemBuilder: (c, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: MyUtils.randomColor(),
                    ),
                    title: Text("Song Name ${i + 1}"),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    subtitle: const Text("Songs Subtitle"),
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
