class Post {
  final int id;
  final String username;
  final String title;
  final String content;
  final String imageUrl;
  final int upvotes;
  final int downvotes;
  final List<String> comments;

  Post({
    required this.id,
    required this.username,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.upvotes,
    required this.downvotes,
    required this.comments,
  });
}

List<Post> dummyPosts = [
  Post(
    id: 1,
    username: "@pecinta_koding",
    title: "Tips Belajar Flutter dalam 30 Hari",
    content:
        "Fokus pada widget dasar, pahami State Management, dan jangan lupa baca dokumentasi resmi!",
    imageUrl:
        "https://images.pexels.com/photos/11035380/pexels-photo-11035380.jpeg",
    upvotes: 1250,
    downvotes: 12,
    comments: [
      "Sangat membantu!",
      "State management mana yang paling oke?",
      "Setuju banget.",
    ],
  ),
  Post(
    id: 2,
    username: "@petualang_maya",
    title: "Pemandangan Pagi di Gunung Bromo",
    content:
        "Gak nyesel bangun jam 3 pagi buat liat view sekeren ini. Indonesia emang juara!",
    imageUrl:
        "https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg",
    upvotes: 3400,
    downvotes: 5,
    comments: [
      "Keren parah!",
      "Minggu depan kesana ah.",
      "Pakai kamera apa gan?",
    ],
  ),
  Post(
    id: 3,
    username: "@tukang_makan",
    title: "Review Jujur Ramen Viral",
    content: "Kuahnya kental tapi menurutku terlalu asin. Rating: 7/10.",
    imageUrl:
        "https://images.pexels.com/photos/1907228/pexels-photo-1907228.jpeg",
    upvotes: 450,
    downvotes: 80,
    comments: [
      "Padahal enak lho disana.",
      "Selera sih ya.",
      "Coba yang di cabang satunya!",
    ],
  ),
  Post(
    id: 4,
    username: "@gadget_enthusiast",
    title: "Setup Meja Kerja 2026",
    content: "Minimalis adalah kunci produktivitas. Bagaimana menurut kalian?",
    imageUrl:
        "https://images.pexels.com/photos/38568/apple-imac-ipad-workplace-38568.jpeg",
    upvotes: 890,
    downvotes: 15,
    comments: [
      "Kabel management-nya rapi banget.",
      "Spill lampunya dong.",
      "Inspiratif!",
    ],
  ),
  Post(
    id: 5,
    username: "@kucing_oren",
    title: "Majikan Baru Saya",
    content:
        "Dia suka kasih makan telat, tapi gapapa yang penting bisa tidur di sofa.",
    imageUrl:
        "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg",
    upvotes: 5600,
    downvotes: 2,
    comments: [],
  ),
];
