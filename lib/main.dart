import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppCloneApp());
}

class WhatsAppCloneApp extends StatelessWidget {
  const WhatsAppCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A884),
          primary: const Color(0xFF00A884),
          surface: const Color(0xFF111B21),
        ),
        scaffoldBackgroundColor: const Color(0xFF111B21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F2C34),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ChatsTab(),
    UpdatesTab(),
    CommunitiesTab(),
    CallsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1F2C34),
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Communities'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        ],
      ),
    );
  }
}

// ==========================================
// 1. CHATS TAB
// ==========================================
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  final List<Map<String, dynamic>> _chats = const [
    {
      'name': 'Eng Muhammed Omar',
      'message': 'check out the new task!!!!!!',
      'time': '9:00 AM',
      'unread': 3,
      'isGroup': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade700,
              child: Icon(
                chat['isGroup'] ? Icons.group : Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              chat['message'],
              style: TextStyle(color: Colors.grey.shade400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(
                    color: chat['unread'] > 0
                        ? const Color(0xFF00A884)
                        : Colors.grey.shade400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                if (chat['unread'] > 0)
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A884),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat['unread']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        child: const Icon(Icons.message, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}

// ==========================================
// 2. UPDATES TAB (Status)
// ==========================================
class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Status',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A884),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              'My status',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Tap to add status update',
              style: TextStyle(color: Colors.grey.shade400),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. COMMUNITIES TAB
// ==========================================
class CommunitiesTab extends StatelessWidget {
  const CommunitiesTab({super.key});

  final List<Map<String, dynamic>> _communities = const [
    {
      'name': 'Flutter Internship',
      'description': 'Official community for announcements.',
      'groups': ['Announcements', 'Official', 'Flutter Group'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Communities',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              width: 48,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.groups, color: Colors.white, size: 28),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF00A884),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            title: const Text(
              'New community',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          const Divider(color: Color(0xFF222D34), thickness: 8),
          ..._communities.map((community) {
            return Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A884).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.groups, color: Color(0xFF00A884)),
                  ),
                  title: Text(
                    community['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    community['description'],
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ),
             //   const Divider(color: Color(0xFF222D34), height: 1),
                ...(community['groups'] as List<String>).map((groupName) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 32, right: 16),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.chat, color: Colors.white, size: 18),
                    ),
                    title: Text(
                      groupName,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    trailing: Text(
                      '12:15 PM',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                    ),
                  );
                }),
              //  const Divider(color: Color(0xFF222D34), thickness: 8),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ==========================================
// 4. CALLS TAB
// ==========================================
class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  final List<Map<String, dynamic>> _calls = const [
    {
      'name': 'Ahmed Mohamed',
      'time': 'Today, 1:15 PM',
      'isIncoming': true,
      'isVideo': false,
      'isMissed': true,
    },
    {
      'name': 'Mom',
      'time': 'Yesterday, 8:30 PM',
      'isIncoming': false,
      'isVideo': true,
      'isMissed': false,
    },
    {
      'name': 'Ali',
      'time': '12 October, 4:00 PM',
      'isIncoming': true,
      'isVideo': false,
      'isMissed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calls',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF00A884),
              child: const Icon(Icons.link, color: Colors.black),
            ),
            title: const Text(
              'Create call link',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Share a link for your WhatsApp call',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Recent',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ..._calls.map((call) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                call['name'],
                style: TextStyle(
                  color: call['isMissed'] ? Colors.redAccent : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    call['isIncoming']
                        ? Icons.call_received
                        : Icons.call_made,
                    size: 16,
                    color: call['isMissed'] ? Colors.redAccent : const Color(0xFF00A884),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    call['time'],
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
              trailing: Icon(
                call['isVideo'] ? Icons.videocam : Icons.call,
                color: const Color(0xFF00A884),
              ),
              onTap: () {},
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        child: const Icon(Icons.add_call, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}