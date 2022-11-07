class OnBoardData {
  final String image, title, description;

  OnBoardData(
      {required this.image, required this.title, required this.description});

  static List<OnBoardData> demoOnBoard = [
    OnBoardData(
      image: 'assets/icons/onboard-svg-1.svg',
      title: 'Making your days with \nour coffee.',
      description:
          'The best grain, the finest roast,\nthe most powerful flavor.',
    ),
    OnBoardData(
      image: 'assets/icons/onboard-svg-1.svg',
      title: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
      description:
          'Curabitur porta magna ut accumsan varius.\nNam ut ante at arcu vestibulum sollicitudin sit amet vel orci.',
    ),
    OnBoardData(
      image: 'assets/icons/onboard-svg-1.svg',
      title: 'Aliquam tincidunt\nnibh sit amet lacus accumsan',
      description:
          'Donec in quam tempor,\ntempus ipsum ut, posuere est. In hac habitasse platea dictumst. Proin nunc urna',
    ),
  ];
}
