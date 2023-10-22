import 'package:flutter/material.dart';
import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/function.dart';
import 'package:hapex_admin/screens/sub_pages/functions.dart';
import 'package:video_player/video_player.dart';

class ManageSubscription extends StatelessWidget {
  const ManageSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        centerTitle: true,
        title: Text(
          'Manage Subscription',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/course_bg.jpg'),
                child: Text('IFCP'),
              ),
              title: Text(
                'USER $index',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('USER$index@gmail'),
                  Text('123456789$index'),
                ],
              ),
              tileColor: kMainCreamColor,
              trailing: MaterialButton(
                  color: kMainOrengeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  onPressed: () {
                    manageSubscription(context);
                  },
                  child: Text(
                    'Subscribed',
                    style: TextStyle(color: kTextWhiteColor),
                  )),
            );
          },
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://172.20.10.2:5000/videos/video1.mp4'
        // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        ))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(), // Show loading indicator until the video is initialized
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              print(_controller.dataSource);
              print(_controller.dataSourceType);
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        )
      ],
    );

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }
  }
}
