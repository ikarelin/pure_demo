import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_demo/pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool privacyEnabled = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey[900], // Темный фон как на скриншоте
      builder: (BuildContext context) {
        return BottomSheetContent(
          onBuyPressed: () {
            setState(() {
              privacyEnabled =
                  true; // Меняем статус только при нажатии на "Купить"
            });
            Navigator.pop(context); // Закрываем Bottom Sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Stack(
        children: [
          Positioned(bottom: 0, child: _bottomBar()),
          Positioned(
            bottom: 60,
            child: Container(
              height: MediaQuery.of(context).size.height - 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF212020),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _chatHeaderWidget(),

                  _likesWidget(),
                  SizedBox(height: 8),
                  _chatListWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatHeaderWidget() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          SizedBox(width: 16),
          Text('ЧАТЫ', style: TextStyle(fontSize: 20, color: Colors.white)),
          Spacer(),
          Text(
            !privacyEnabled ? 'OFF' : 'ON',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: () {
              setState(() {
                if (privacyEnabled == false) {
                  _showBottomSheet(context);
                } else {
                  privacyEnabled = !privacyEnabled;
                }
              });
            },
            icon: Image.asset('assets/Swithers.png', width: 40, height: 20),
          ),

          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _likesWidget() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          SizedBox(width: 10),
          SvgPicture.asset('assets/purple_heart.svg'),
          SizedBox(width: 10),
          Text(
            '44 человека тебя лайкнули',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _chatListWidget() {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: [
          _chatListTile(
            'assets/user1.jpeg',
            '23 ч 43 мин ',
            'Отлично выглядишь',
            false,
          ),
          SizedBox(height: 16),
          _chatListTile(
            'assets/user2.jpeg',
            '20 ч 40 мин',
            'Встретимся? Я рядом',
            true,
          ),
          SizedBox(height: 16),
          _chatListTile(
            'assets/user3.jpeg',
            '18 ч 40 мин',
            'Встретимся?',
            false,
          ),
          SizedBox(height: 16),
          _chatListTile(
            'assets/user4.jpeg',
            '09 ч 40 мин',
            'Давно тебя хочу',
            false,
          ),
          SizedBox(height: 16),
          _chatListTile(
            'assets/user5.jpeg',
            '03 ч 04 мин',
            'Я в ванной... Скинь фото..',
            false,
          ),
          SizedBox(height: 16),
          _chatListTile('assets/user6.jpeg', '01 ч 09 мин', 'Привет', false),
          // List item 2
          // ...
        ],
      ),
    );
  }

  Widget _chatListTile(
    String picture,
    String date,
    String message,
    bool unread,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(0),
        color: Color(0xFF212020),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(backgroundImage: AssetImage(picture)),
              ),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: TextStyle(color: Colors.white, fontSize: 12)),
                Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            if (unread == true) Spacer(),
            if (unread == true)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF191818),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_left.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_chat.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_heart.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_settings.png'),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final VoidCallback onBuyPressed;

  const BottomSheetContent({super.key, required this.onBuyPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF031333),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Icon(Icons.remove_red_eye, color: Colors.purple, size: 40),
              Spacer(),
              Image.asset('assets/glasses_big.png'),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.pop(context), // Просто закрываем
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "РЕЖИМ ИНКОГНИТО НА 24 ЧАСА",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Стань невидимкой в чате и читай, сколь угодно времени наслаждаясь <Space> незамеченным",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOptionCard(context, 1),
              _buildOptionCard(context, 2),
              _buildOptionCard(context, 3),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onBuyPressed, // Меняем статус и закрываем
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Цвет кнопки как на скриншоте
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Купить",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "УСЛОВИЯ И ПОЛОЖЕНИЯ",
              style: TextStyle(color: Color(0xFFF6F4F4), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, int number) {
    return GestureDetector(
      onTap: () => Navigator.pop(context), // Просто закрываем при выборе опции
      child: Image.asset('assets/price$number.png'),
    );
  }
}
