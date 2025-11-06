import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nexora Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFeatureCard(
                    context,
                    Icons.smart_toy,
                    'NexoBot AI',
                    const Color(0xFF6C63FF),
                  ),
                  const SizedBox(width: 12),
                  _buildFeatureCard(
                    context,
                    Icons.groups,
                    'Groups',
                    const Color(0xFF00D4AA),
                  ),
                  const SizedBox(width: 12),
                  _buildFeatureCard(
                    context,
                    Icons.call,
                    'Calls',
                    const Color(0xFFFF6B6B),
                  ),
                  const SizedBox(width: 12),
                  _buildFeatureCard(
                    context,
                    Icons.lock,
                    'Hidden',
                    const Color(0xFFFFB800),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildChatTile(
                  context,
                  'User ${index + 1}',
                  'Last message preview goes here...',
                  '${index + 1}m ago',
                  index % 3 == 0,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6C63FF),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, IconData icon, String label, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(BuildContext context, String name, String message, String time, bool hasUnread) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF6C63FF),
        child: Text(
          name[0],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: hasUnread ? const Color(0xFF6C63FF) : Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          if (hasUnread)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              ),
            ),
          Expanded(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: hasUnread ? Colors.black87 : Colors.grey,
                fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
      trailing: hasUnread
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: const Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      onTap: () {},
    );
  }
}