import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:vo_app/classes/classes.dart';
import 'package:vo_app/reusable_components/language_button.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final bool isCareer;
  final String title;
  final VideoItem item;
  const VideoPage(
      {super.key,
      required this.item,
      required this.isCareer,
      required this.title});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;
  late String url;
  late final chewieController;

  @override
  void initState() {
    super.initState();
    url = widget.item.url;
    Uri uri = Uri.parse(url);
    _controller = VideoPlayerController.networkUrl(
      uri,
    );

    _initializeVideoPlayer = initialize();

    // final ChewieController = ChewieController (videoPlayerController: videoPlayerController)
    // _controller.setLooping(false);
    // _controller.setVolume(1);
    // _controller.play();
  }

  Future<void> initialize() async {
    await _controller.initialize();
    chewieController = ChewieController(
        videoPlayerController: _controller, autoPlay: true, looping: false);
    return;
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          title: Text(widget.title, style: Fonts.homePageCardLabel),
          backgroundColor:
              widget.isCareer ? AppColors.weakedGreen : AppColors.spaceCadet,
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Chewie(controller: chewieController),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            Expanded(
                child: Text(
              widget.item.title,
              style: Fonts.header3,
              textAlign: TextAlign.center,
            )),
            widget.item.nextItem != null
                ? Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: LanguageButton(
                        language: widget.item.nextItem!.title,
                        active: false,
                        onPressed: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => VideoPage(
                                  item: widget.item.nextItem!,
                                  isCareer: widget.isCareer,
                                  title: widget.title),
                            ))),
                  )
                : Container(),
          ],
        ));
  }
}
