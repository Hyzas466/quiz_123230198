import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'detail_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map to store vote status. key: post.id, value: 'up' or 'down'
  final Map<int, String> _voteStatus = {};

  void _handleUpvote(int postId) {
    setState(() {
      if (_voteStatus[postId] == 'up') {
        _voteStatus.remove(postId);
      } else {
        _voteStatus[postId] = 'up';
      }
    });
  }

  void _handleDownvote(int postId) {
    setState(() {
      if (_voteStatus[postId] == 'down') {
        _voteStatus.remove(postId); // Undo downvote
      } else {
        _voteStatus[postId] =
            'down'; // Set to downvote (will replace upvote if exists)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.username}!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          final vote = _voteStatus[post.id];

          int currentUpvotes = post.upvotes + (vote == 'up' ? 1 : 0);
          int currentDownvotes = post.downvotes + (vote == 'down' ? 1 : 0);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        post.username,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      post.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: vote == 'up' ? Colors.orange : Colors.grey,
                            ),
                            onPressed: () => _handleUpvote(post.id),
                          ),
                          Text('$currentUpvotes'),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: vote == 'down' ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () => _handleDownvote(post.id),
                          ),
                          Text('$currentDownvotes'),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDetailPage(post: post),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
