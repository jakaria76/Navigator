import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vlogging Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VloggingPage(),
    );
  }
}

class VloggingPage extends StatefulWidget {
  @override
  _VloggingPageState createState() => _VloggingPageState();
}

class _VloggingPageState extends State<VloggingPage> {
  File? _video;
  final picker = ImagePicker();
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child('videos');
  }

  Future pickVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
      }
    });
  }

  Future uploadVideo() async {
    if (_video == null) return;

    Reference ref =
    FirebaseStorage.instance.ref().child('videos').child('video.mp4');
    UploadTask uploadTask = ref.putFile(_video!);
    await uploadTask.whenComplete(() => null);

    String downloadURL = await ref.getDownloadURL();

    // Save the download URL to the database for future access
    _databaseReference.push().set({'url': downloadURL});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Vlogging Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _video == null
                  ? Text('No video selected.')
                  : VideoPlayerWidget(videoFile: _video!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickVideo,
                child: Text('Pick Video'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadVideo,
                child: Text('Upload Video'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllVideosPage()),
                  );
                },
                child: Text('View All Videos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllVideosPage extends StatefulWidget {
  @override
  _AllVideosPageState createState() => _AllVideosPageState();
}

class _AllVideosPageState extends State<AllVideosPage> {
  late List<String> videoUrls = [];
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child('videos');
    _loadVideos();
  }

  void _loadVideos() {
    _databaseReference.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          videoUrls.clear();
          values.forEach((key, value) {
            if (value is Map && value['url'] != null) {
              videoUrls.add(value['url']);
            }
          });
        });
      }
    }).catchError((error) {
      print("Failed to load videos: $error");
    });
  }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Videos'),
      ),
      body: ListView.builder(
        itemCount: videoUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoPlayerWidget(videoUrl: videoUrls[index]);
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File? videoFile;
  final String? videoUrl;

  const VideoPlayerWidget({Key? key, this.videoFile, this.videoUrl})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoFile != null) {
      _controller = VideoPlayerController.file(widget.videoFile!)
        ..initialize().then((_) {
          setState(() {});
        });
    } else if (widget.videoUrl != null) {
      _controller = VideoPlayerController.network(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
