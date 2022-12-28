
import 'package:flutter/material.dart';
import 'package:social_me/services/posts.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    String text = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tweet"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () async{
              _postService.savePost(text);
              Navigator.pop(context);
            },
            child: const Text("Tweet"),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
            child: TextFormField(
              onChanged: (val){
                setState(() {
                  text = val;
                });
              },
            )),
      ),
    );
  }
}