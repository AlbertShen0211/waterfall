import 'package:flutter/material.dart';

class QuickActionRow extends StatelessWidget {
  const QuickActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actions = [
      {
        'icon': Icons.map_outlined,
        'label': '探索路线',
        'color': const Color(0xFF6C63FF),
      },
      {
        'icon': Icons.location_on_outlined,
        'label': '标记点',
        'color': const Color(0xFF4CA1AF),
      },
      {
        'icon': Icons.edit_outlined,
        'label': '答题考试',
        'color': const Color(0xFF2C3E50),
      },
      {
        'icon': Icons.people_outline,
        'label': '好友匹配',
        'color': const Color(0xFFFF6B6B),
      },
      {
        'icon': Icons.book_outlined,
        'label': '学习中心',
        'color': const Color(0xFF4ECDC4),
      },
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (c, i) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          final color = actions[index]['color'] as Color;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color.withOpacity(0.8), color],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  actions[index]['icon'] as IconData,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actions[index]['label'] as String,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          );
        },
      ),
    );
  }
}
