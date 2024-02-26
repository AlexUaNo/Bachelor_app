import 'package:vo_app/classes/classes.dart';

List<PageItem> carrerPageItems = [
  PageItem(
      content: 'Introduction',
      active: true,
      items: introduction,
      onPressed: () {}),
  PageItem(
      content: 'My Context',
      active: true,
      items: introduction,
      onPressed: () {}),
  PageItem(
      content: 'Possibilities',
      active: true,
      items: introduction,
      onPressed: () {}),
  PageItem(
      content: 'Choices', active: true, items: introduction, onPressed: () {}),
  PageItem(
      content: 'Changes', active: true, items: introduction, onPressed: () {}),
];

final List<PageDetailsItem> introduction = [
  PageDetailsItem(
    title: '1. What is ...? ',
    items: introFirst,
    onPressed: () {},
  ),
  PageDetailsItem(
    title: '2. Career and life management',
    items: introSecond,
    onPressed: () {},
  ),
  PageDetailsItem(
    title: '3. Who can I ask for help?',
    items: introThird,
    onPressed: () {},
  ),
  PageDetailsItem(
    title: '4. Finding friends',
    items: introFourth,
    onPressed: () {},
  ),
];

final VideoItem introFirst = VideoItem(
  title: 'What is ...?',
  url: 'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
  nextItem: introSecond,
);

final VideoItem introSecond = VideoItem(
  title: '2. Career and life management',
  url: 'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
  nextItem: introThird,
);

final VideoItem introThird = VideoItem(
  title: '3. Who can I ask for help?',
  url: 'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
  nextItem: introFourth,
);

final VideoItem introFourth = VideoItem(
  title: '4. Finding friends',
  url: 'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
  nextItem: null,
);
