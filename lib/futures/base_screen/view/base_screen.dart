import 'package:caloriegram/ui/theme/colors.dart';
import 'package:caloriegram/ui/ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  int _cIndexGraf = 0;
  List cardList = [
    const Calories(),
    const Macros(),
    const HeartHealthy(),
  ];
  List grafList = [
    const Calories(),
    const HeartHealthy(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: AppColors.whiteColor,
        pinned: true,
        snap: true,
        leadingWidth: 100,
        floating: true,
        centerTitle: true,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: AppColors.ligthGrey,
                child: const Text('Logo')),
          ),
        ),
        title: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.appYellow),
              fixedSize: MaterialStatePropertyAll(
                Size.fromWidth(173),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Get premium',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/icons/premium.svg')
              ],
            )),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/notification.svg'),
              onPressed: () {},
            ),
          )
        ],
        surfaceTintColor: Colors.transparent,
      ),
      // const SliverToBoxAdapter(
      //   child: SizedBox(height: 16),
      // ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'Today',
            style: theme.textTheme.headlineMedium!.copyWith(letterSpacing: 0.4),
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(height: 6),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                // height: 200.0,
                autoPlay: false,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return SizedBox(
                    height: 198,
                    width: 298,
                    child: Card(
                      color: Colors.white,
                      child: card,
                    ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == index ? AppColors.black : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(height: 106, width: 144, child: Card()),
            SizedBox(height: 106, width: 144, child: Card()),
          ]),
        ),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                // height: 200.0,
                autoPlay: false,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _cIndexGraf = index;
                  });
                },
              ),
              items: grafList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    height: 198,
                    width: 298,
                    child: Card(
                      color: Colors.white,
                      child: card,
                    ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(grafList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _cIndexGraf == index ? AppColors.black : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      )
    ]);
  }
}
