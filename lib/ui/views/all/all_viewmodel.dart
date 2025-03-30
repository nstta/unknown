import 'dart:ui';
import 'package:stacked/stacked.dart';
import 'package:unknown/constants/assets.dart';
import 'package:unknown/ui/widgets/info_box.dart';
import 'package:unknown/ui/widgets/random_box.dart';

class AllViewModel extends BaseViewModel {
  List<InfoBox> infoBoxes = const [
    InfoBox(
        title: 'Flutter',
        number: 1,
        subtitle:
            'Squarespace Design Course / Graphic Design Course / Video Creator Course / Shopify Course / 3D Blender Course / Creative Copywriting Course / Finance Friends Forever / Social Media Manager Course / Fashion Design Course'),
    InfoBox(
        title: 'React',
        number: 2,
        subtitle:
            'Community Ads — creatives post ads (jobs, events, workshops, internships, etc.) and we send → them to inboxes across the glove every Wednesday since ✹2014.'),
    InfoBox(
        title: 'Certificated',
        number: 3,
        subtitle:
            'Creative Profiles — this ain’t no resume dumping ground. When someone reads your profile, we want it to feel like they just grabbed a coffee with you and totally get it.'),
    InfoBox(
        title: 'Experience',
        number: 4,
        subtitle:
            'Internet Gems / Interviews / Grow Spreadsheet / Student Loan Calculator / Productivity Timer / Spotify Playlists / 1-800-HEYPUNO / It’s Fun! Podcast'),
    InfoBox(
        title: 'Contact',
        number: 5,
        subtitle:
            'Digital Goods — Font Books /  Do The Math Spreadsheet / Squarespace Templates / Mockups ✹ Physical Goods — Ideas Journal & Notebook / Nalgene / Nail Stickis'),
  ];

  List<RandomBox> randomBoxes = const [
    RandomBox(
        title: '➄ Ideas Journal\n& Notebook',
        asset: Assets.assetsImagesCard,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➄ fly emily',
        asset:
            "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExM3ZxMmo0MHB0dXFzajkyY2FkdnR1ZHZodnphZG5jb3RzNzFhNm1idyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/R3K8ksVB2hDJhs41lx/giphy.gif",
        width: 100,
        height: 100,
        type: AssetType.gif),
    RandomBox(
        title: '➂ Creative Profile',
        asset: Assets.assetsImagesDucktape,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ community ad',
        asset: Assets.assetsImagesPapaya,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ wednesday weekly',
        asset: Assets.assetsImagesShell,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➄ bonnana',
        asset:
            "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExemM1bjdvOTY2NW93Z2V3N2ViYTFuanJtZ3k2ajh2a3g5azEyeGFlbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5xtDarztN4Auy4RtLws/giphy.gif",
        width: 100,
        height: 100,
        type: AssetType.gif),
    RandomBox(
        title: '➁ going to the moon',
        asset: Assets.assetsImagesGreen,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ tag more',
        asset: Assets.assetsImagesTag,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ peach me!',
        asset: Assets.assetsImagesPeach,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ pearl me!',
        asset: Assets.assetsImagesPearl,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➁ tamagotji',
        asset: Assets.assetsImagesTamagotji,
        width: 100,
        height: 100,
        type: AssetType.image),
    RandomBox(
        title: '➄ 2023 Planner',
        asset: "https://media.giphy.com/media/l0HUqsz2jdQYElRm0/giphy.gif",
        width: 100,
        height: 100,
        type: AssetType.gif),
  ];

  List<Offset> boxPositions =
      List.generate(10, (index) => Offset(50.0 * index, 50.0));

  void updateBoxPosition(int index, Offset newPosition) {
    boxPositions[index] = newPosition;
    notifyListeners();
  }

  bool hasInitializedPositions = false;

  void initializeBoxPositions(double areaWidth, double areaHeight) {
    if (hasInitializedPositions) return;

    const int columns = 4;
    double spacing = 30;
    double boxWidth = randomBoxes.first.width;
    double boxHeight = randomBoxes.first.height;

    double totalWidth = columns * boxWidth + (columns - 1) * spacing;
    int rows = (randomBoxes.length / columns).ceil();
    double totalHeight = rows * boxHeight + (rows - 1) * spacing;

    double startX = (areaWidth - totalWidth) / 2 + areaWidth;
    double startY = (areaHeight - totalHeight) / 2;

    boxPositions.clear();

    for (int i = 0; i < randomBoxes.length; i++) {
      int row = i ~/ columns;
      int col = i % columns;

      double x = startX + col * (boxWidth + spacing);
      double y = startY + row * (boxHeight + spacing);

      boxPositions.add(Offset(x, y));
    }

    hasInitializedPositions = true;
    notifyListeners();
  }
}
