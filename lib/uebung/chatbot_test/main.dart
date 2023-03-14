import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chatbot Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatbotPage(),
    );
  }
}


class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage(String message) async {
    _controller.clear();

    final response = await sendMessageToChatbot(message);

    if (response.statusCode == 200) {
      final jsonString = utf8.decode(response.bodyBytes);
      final responseBody = jsonDecode(jsonString);
      print("### responseBody: $responseBody");
      final chatbotMessage = responseBody['response'];
      setState(() {
        _messages.insert(0, chatbotMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message),
                  leading: Icon(Icons.chat_bubble),
                );
              },
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Send a message',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _sendMessage(_controller.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<http.Response> sendMessageToChatbot(String message) async {
  print("### massage: $message");
  final response = await http.post(
    Uri.parse('http://flussberg.shop/chatbot/test'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'message': message,
    }),
  );
  return response;
}
