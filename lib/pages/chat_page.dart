import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        title: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/user1.jpeg'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height - 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF212020),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Начни общение',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: _inputWidget(),
                ),
              ],
            ),
          ),
        ),
        Positioned(top: 0, child: _infoWidget()),
      ],
    );
  }

  Widget _infoWidget() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF7446AC),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Image.asset('assets/rocket.png'),
            SizedBox(width: 8),
            Text(
              '2 общих соблазна',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/cross.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputWidget() {
    return Row(
      children: [
        // Иконка "плюс" (вне рамки)
        IconButton(
          icon: const Icon(Icons.add, color: Colors.grey, size: 34),
          onPressed: () {},
        ),
        // Контейнер с текстовым полем и аватаром (внутри рамки)
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Текстовое поле
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Сообщение...",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Аватар
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/alien.png'),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Иконка микрофона (вне рамки)
        IconButton(
          icon: const Icon(
            Icons.mic_none_outlined,
            color: Colors.grey,
            size: 34,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
