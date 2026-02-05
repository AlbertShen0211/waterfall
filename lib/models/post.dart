// import 'package:flutter/material.dart';

class Post {
  final int id;
  final String image;
  final String status;
  final bool isOfficial;
  final String title;
  final String date;
  final String departure;
  final String duration;
  final List<String> tags;
  final double price;
  final int participants;
  final String userAvatar;
  final String userName;

  const Post({
    required this.id,
    required this.image,
    required this.status,
    required this.isOfficial,
    required this.title,
    required this.date,
    required this.departure,
    required this.duration,
    required this.tags,
    required this.price,
    required this.participants,
    required this.userAvatar,
    required this.userName,
  });

  // Performance Optimization:
  // Extract aspect ratio from the Picsum URL (e.g., "400/500") to prevent layout shifts.
  // In a real API, the backend should return width and height.
  double get aspectRatio {
    try {
      final parts = image
          .split('?')[0]
          .split('/'); // Split "https://.../400/500"
      if (parts.length >= 2) {
        final height = double.tryParse(parts[parts.length - 1]);
        final width = double.tryParse(parts[parts.length - 2]);
        if (width != null && height != null && height > 0) {
          return height / width; // Return H/W ratio (1.25 for 400/500)
        }
      }
    } catch (e) {
      // Fallback
    }
    return 1.3; // Default fallback ratio
  }
}

final List<Post> MOCK_POSTS = [
  const Post(
    id: 1,
    image: 'https://picsum.photos/400/500?random=1',
    status: '进行中',
    isOfficial: true,
    title: '官方大型活动 | 乌孙古道徒步节',
    date: '08.09',
    departure: '北京出发',
    duration: '3-4天',
    tags: ['徒步', '纯玩', '季节限定'],
    price: 500.00,
    participants: 12,
    userAvatar: 'https://picsum.photos/50/50?random=10',
    userName: '不吃香菜',
  ),
  const Post(
    id: 2,
    image: 'https://picsum.photos/400/600?random=2',
    status: '报名中',
    isOfficial: false,
    title: '雪山攀登挑战 | 四姑娘山',
    date: '08.15',
    departure: '成都出发',
    duration: '5-6天',
    tags: ['登山', '挑战', '专业'],
    price: 1200.00,
    participants: 8,
    userAvatar: 'https://picsum.photos/50/50?random=11',
    userName: '冒险家',
  ),
  const Post(
    id: 3,
    image: 'https://picsum.photos/400/450?random=3',
    status: '报名中',
    isOfficial: true,
    title: '草原露营体验 | 呼伦贝尔',
    date: '08.20',
    departure: '北京出发',
    duration: '2-3天',
    tags: ['露营', '休闲', '亲子'],
    price: 800.00,
    participants: 25,
    userAvatar: 'https://picsum.photos/50/50?random=12',
    userName: '户外达人',
  ),
  const Post(
    id: 4,
    image: 'https://picsum.photos/400/550?random=4',
    status: '进行中',
    isOfficial: false,
    title: '沙漠穿越 | 腾格里沙漠',
    date: '08.25',
    departure: '银川出发',
    duration: '4-5天',
    tags: ['沙漠', '探险', '极限'],
    price: 1500.00,
    participants: 15,
    userAvatar: 'https://picsum.photos/50/50?random=14',
    userName: '沙丘行者',
  ),
  const Post(
    id: 5,
    image: 'https://picsum.photos/400/500?random=5',
    status: '报名中',
    isOfficial: false,
    title: '海边冲浪 | 海南三亚',
    date: '09.01',
    departure: '三亚出发',
    duration: '3天',
    tags: ['冲浪', '海边', '休闲'],
    price: 600.00,
    participants: 30,
    userAvatar: 'https://picsum.photos/50/50?random=13',
    userName: '海洋爱好者',
  ),
  const Post(
    id: 6,
    image: 'https://picsum.photos/400/600?random=6',
    status: '报名中',
    isOfficial: true,
    title: '森林徒步 | 长白山',
    date: '09.10',
    departure: '长春出发',
    duration: '4天',
    tags: ['徒步', '森林', '自然'],
    price: 900.00,
    participants: 18,
    userAvatar: 'https://picsum.photos/50/50?random=15',
    userName: '林间漫步',
  ),
  const Post(
    id: 7,
    image: 'https://picsum.photos/400/520?random=7',
    status: '报名中',
    isOfficial: false,
    title: '峡谷溯溪 | 张家界',
    date: '09.15',
    departure: '长沙出发',
    duration: '3天',
    tags: ['溯溪', '避暑', '风景'],
    price: 780.00,
    participants: 16,
    userAvatar: 'https://picsum.photos/50/50?random=16',
    userName: '溪水声',
  ),
  const Post(
    id: 8,
    image: 'https://picsum.photos/400/540?random=8',
    status: '进行中',
    isOfficial: true,
    title: '高原骑行 | 青海湖环湖',
    date: '09.18',
    departure: '西宁出发',
    duration: '5天',
    tags: ['骑行', '高原', '湖畔'],
    price: 1800.00,
    participants: 22,
    userAvatar: 'https://picsum.photos/50/50?random=17',
    userName: '环湖骑手',
  ),
  const Post(
    id: 9,
    image: 'https://picsum.photos/400/560?random=9',
    status: '报名中',
    isOfficial: false,
    title: '海岛露营 | 涠洲岛',
    date: '09.20',
    departure: '北海出发',
    duration: '3天',
    tags: ['露营', '海岛', '日出'],
    price: 950.00,
    participants: 14,
    userAvatar: 'https://picsum.photos/50/50?random=18',
    userName: '岛屿光',
  ),
  const Post(
    id: 10,
    image: 'https://picsum.photos/400/580?random=10',
    status: '进行中',
    isOfficial: true,
    title: '越野跑 | 武功山穿越',
    date: '09.25',
    departure: '萍乡出发',
    duration: '2天',
    tags: ['越野跑', '山脊', '露营'],
    price: 680.00,
    participants: 28,
    userAvatar: 'https://picsum.photos/50/50?random=19',
    userName: '山脊线',
  ),
  const Post(
    id: 11,
    image: 'https://picsum.photos/400/520?random=11',
    status: '报名中',
    isOfficial: false,
    title: '桨板体验 | 西湖',
    date: '09.28',
    departure: '杭州出发',
    duration: '1天',
    tags: ['桨板', '水上', '轻户外'],
    price: 320.00,
    participants: 20,
    userAvatar: 'https://picsum.photos/50/50?random=20',
    userName: '湖上风',
  ),
  const Post(
    id: 12,
    image: 'https://picsum.photos/400/540?random=12',
    status: '报名中',
    isOfficial: true,
    title: '攀岩进阶训练营 | 阳朔',
    date: '10.02',
    departure: '桂林出发',
    duration: '4天',
    tags: ['攀岩', '进阶', '技巧'],
    price: 2100.00,
    participants: 10,
    userAvatar: 'https://picsum.photos/50/50?random=21',
    userName: '石灰岩',
  ),
  const Post(
    id: 13,
    image: 'https://picsum.photos/400/560?random=13',
    status: '进行中',
    isOfficial: false,
    title: '热气球日出 | 吐鲁番',
    date: '10.05',
    departure: '乌鲁木齐出发',
    duration: '2天',
    tags: ['热气球', '日出', '摄影'],
    price: 1500.00,
    participants: 18,
    userAvatar: 'https://picsum.photos/50/50?random=22',
    userName: '空中旅人',
  ),
  const Post(
    id: 14,
    image: 'https://picsum.photos/400/520?random=14',
    status: '报名中',
    isOfficial: false,
    title: '滑雪体验 | 崇礼万龙',
    date: '12.15',
    departure: '张家口出发',
    duration: '2天',
    tags: ['滑雪', '新手', '雪季'],
    price: 880.00,
    participants: 26,
    userAvatar: 'https://picsum.photos/50/50?random=23',
    userName: '粉雪控',
  ),
  const Post(
    id: 15,
    image: 'https://picsum.photos/400/540?random=15',
    status: '进行中',
    isOfficial: true,
    title: '潜水考证 | 三亚',
    date: '11.20',
    departure: '三亚出发',
    duration: '4天',
    tags: ['潜水', '考证', '海底'],
    price: 3200.00,
    participants: 12,
    userAvatar: 'https://picsum.photos/50/50?random=24',
    userName: '深蓝',
  ),
  const Post(
    id: 16,
    image: 'https://picsum.photos/400/560?random=16',
    status: '报名中',
    isOfficial: false,
    title: '冰川徒步 | 四姑娘山海子沟',
    date: '12.28',
    departure: '成都出发',
    duration: '3天',
    tags: ['徒步', '冰川', '雪景'],
    price: 1600.00,
    participants: 14,
    userAvatar: 'https://picsum.photos/50/50?random=25',
    userName: '雪线行者',
  ),
];
