import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'messages';
  final String _userId = 'user123'; // Replace with actual user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection(_collectionName)
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                List<DocumentSnapshot> messages = snapshot.data?.docs ?? [];

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message =
                    messages[index].data() as Map<String, dynamic>;
                    var isSentByUser = message['userId'] == _userId;

                    if (message.containsKey('imageUrl')) {
                      return ImageMessage(
                        imageUrl: message['imageUrl'],
                        isSentByUser: isSentByUser,
                      );
                    } else {
                      return ChatBubble(
                        message: message['text'],
                        isSentByUser: isSentByUser,
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () async {
                    var image = await _pickImage();
                    if (image != null) {
                      _sendMessageWithImage(image);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      return await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      _firestore.collection(_collectionName).add({
        'text': text,
        'userId': _userId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  void _sendMessageWithImage(XFile image) async {
    if (image != null) {
      var imageUrl = await _uploadImageToFirebase(image);
      if (imageUrl != null) {
        _firestore.collection(_collectionName).add({
          'imageUrl': imageUrl,
          'userId': _userId,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    }
  }

  Future<String?> _uploadImageToFirebase(XFile image) async {
    try {
      var snapshot = await _firestore.collection(_collectionName).add({
        'userId': _userId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      var ref = FirebaseStorage.instance
          .ref()
          .child('images/${snapshot.id}')
          .putFile(File(image.path));

      var downloadUrl = await ref.then((taskSnapshot) => taskSnapshot.ref.getDownloadURL());

      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByUser;

  ChatBubble({required this.message, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final String imageUrl;
  final bool isSentByUser;

  ImageMessage({required this.imageUrl, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Image.network(
          imageUrl,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
