import 'package:ardilla/app/features/home/data/model/video_model.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final VideoModel videoModel;

  const VideoPlayerWidget(
      {Key? key, required this.controller, required this.videoModel})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  ChewieController? _chewieController;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    videoPlayerController = widget.controller;
    createChewie(videoPlayerControl: videoPlayerController);
    super.initState();
  }

  createChewie({required VideoPlayerController videoPlayerControl}) async {
    await Future.wait([videoPlayerControl.initialize()]);
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: videoPlayerControl,
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
      );
    });
  }

  Future<void> toggleVideo() async {
    await videoPlayerController.pause();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Center(
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized &&
              _chewieController!.isPlaying
          ? Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left:12.0, top: 12),
                  child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red),
                        borderRadius:const BorderRadius.all(Radius.circular(16))),)),
                ),
                AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,),

              Padding(
                padding: const EdgeInsets.only(right:12.0, bottom: 12),
                child: AspectRatio(
                            aspectRatio: videoPlayerController.value.aspectRatio,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Chewie(
                        controller: _chewieController!,
                      ),
                  ),
                ),
              ),
            ],
          )
          : Stack(
            alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:12.0, top: 12),
                  child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red),
                        borderRadius:const BorderRadius.all(Radius.circular(16))),)),
                ),
                AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,),
                widget.videoModel.coverImage.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.only(right:12.0, bottom: 12.0),
                      child: AspectRatio(
                          aspectRatio: videoPlayerController.value.aspectRatio,
                          child: Image.asset(
                            widget.videoModel.coverImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                    )
                    : const SizedBox.shrink(),
                Padding(
                  padding:  const EdgeInsets.only(right:12.0, bottom: 12.0),
                  child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff030303).withOpacity(0.1),
                                  Color(0xff030303).withOpacity(0.7)
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                      )),
                ),

                
                Positioned(
                  left: 15,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.videoModel.title,
                        style: primaryTextTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      CustomListSpacing(
                          spacingValue: ListSpacingValue.spacingV8.value),
                      Text(
                        widget.videoModel.subtitle,
                        style: primaryTextTheme.titleSmall!
                            .copyWith(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                 
                _chewieController != null
                    ? Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: Material(
                            color:
                                Colors.white.withOpacity(0.3), // Button color
                            child: InkWell(
                              splashColor: Colors.white
                                  .withOpacity(0.8), // Splash color
                              onTap: () {
                                _chewieController!.play();
                                setState(() {});
                              },
                              child: const SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                          ),
                        ),
                      )
                    : const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
              ],
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
