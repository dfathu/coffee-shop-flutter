import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_1/bloc/onboard/onboardbloc.dart';
import 'package:test_1/bloc/onboard/onboardbloc_event.dart';
import 'package:test_1/bloc/onboard/onboardbloc_state.dart';

import 'package:test_1/constant/colors.dart';
import 'package:test_1/constant/routes.dart';
import 'package:test_1/constant/typographs.dart';
import 'package:test_1/data/data_onboard.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  List<OnBoardData> data = OnBoardData.demoOnBoard;
  // int _pageIndex = 0;
  IndexinBloc bloc = IndexinBloc(0);

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    bloc = BlocProvider.of<IndexinBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: data.length,
                controller: _pageController,
                onPageChanged: (value) {
                  bloc.add(ReIndexEvent(value));
                },
                itemBuilder: ((context, index) => OnBoardingContent(
                      image: data[index].image,
                      title: data[index].title,
                      description: data[index].description,
                      data: data,
                    )),
              ),
            ),
            BlocBuilder<IndexinBloc, IndexState>(
              bloc: bloc,
              builder: (context, currentstate) {
                print('UI getValue by currrentState ' +
                    currentstate.indexin.toString());
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 47,
                        bottom: 50,
                      ),
                      height: 86,
                      width: 86,
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            data.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DotIndicator(
                                isActive: index == currentstate.indexin,
                                index: index,
                                pageControllerDot: _pageController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 47,
                        bottom: 50,
                      ),
                      height: 86,
                      width: 86,
                      child: ElevatedButton(
                        onPressed: () {
                          currentstate.indexin == 2
                              ? Navigator.pushNamed(context, Routes.screenMain)
                              : _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.colorTextPrimary,
                            shape: CircleBorder()),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String image, title, description;
  final List<OnBoardData> data;
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(image),
            const SizedBox(
              height: 63,
            ),
            Text(
              title,
              style: AppTypographs.textHead,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              description,
              style: AppTypographs.textSubHead,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;
  final PageController pageControllerDot;
  final int index;

  const DotIndicator(
      {Key? key,
      required this.isActive,
      required this.pageControllerDot,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageControllerDot.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 15,
        width: isActive ? 50 : 15,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.colorTextPrimary
              : AppColors.colorTextPrimary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
