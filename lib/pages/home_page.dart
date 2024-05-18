import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listChoices = <ItemChoice>[
    ItemChoice(id: 1, label: 'Topik 1', isSelected: true),
    ItemChoice(id: 2, label: 'Topik 2', isSelected: false),
    ItemChoice(id: 3, label: 'Topik 3', isSelected: false),
    ItemChoice(id: 4, label: 'Topik 4', isSelected: false),
    ItemChoice(id: 5, label: 'Topik 5', isSelected: false),
    ItemChoice(id: 6, label: 'Topik 6', isSelected: false),
    ItemChoice(id: 7, label: 'Topik 7', isSelected: false),
  ];

  final listAgenda = <PostModel>[
    PostModel(
      id: 1,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
    PostModel(
      id: 2,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
    PostModel(
      id: 3,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari agenda dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
  ];

  final listArtikel = <PostModel>[
    PostModel(
      id: 1,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
    PostModel(
      id: 2,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
    PostModel(
      id: 3,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
    PostModel(
      id: 4,
      title: 'Dr. Abdullah Roy, M.A',
      excerpt: 'Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      content: 'Konten Deskripsi/Kutipan singkat dari artikel dijelaskan pada kolom ini. Deskripsi singkat dari artikel dijelaskan pada kolom ini... ',
      status: 'published',
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1659043833.
        searchBox(),
        topicWidget(),
        buildHeader(
          title: 'Agenda',
          seeMore: TextButton(
            onPressed: () {},
            child: const Text('Lihat Semua >'),
          ),
        ),
        postWidget(contents: listAgenda),
        buildHeader(
          title: 'Artikel',
          seeMore: TextButton(
            onPressed: () {},
            child: const Text('Lihat Semua >'),
          ),
        ),
        postWidget(contents: listArtikel),
      ],
    );
  }

  Widget postWidget({
    required List<PostModel> contents,
  }) {
    return Container(
      height: 320,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: contents.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          var item = contents[index];
          return buildItemPost(item);
        },
      ),
    );
  }

  Widget buildItemPost(PostModel item){
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/350x150",
            imageBuilder: (context, imageProvider) {
              return Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item.excerpt,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (){
                    },
                    icon: const Icon(Icons.flash_on),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){
                },
                icon: const Icon(Icons.bookmark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String title,
    Widget? seeMore,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          seeMore ?? const SizedBox(),
        ],
      ),
    );
  }

  Widget topicWidget() {
    return Container(
      height: 32,
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listChoices.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          var item = listChoices[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              label: Text(item.label),
              selected: item.isSelected,
              onSelected: (bool value) {  },
            ),
          );
        },
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children:[
              Expanded(
                flex: 2,
                child: Text('Temukan Jadwal Kajian Dengan Mudah',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.notification_add),
              ),
            ] 
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "apa yang ingin kamu cari ?",
              fillColor: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class PostModel {
  int id;
  String title;
  String excerpt;
  String content;
  String status;
  String imageUrl;

  PostModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.status,
    required this.imageUrl,
  });

}

class ItemChoice {
  final int id;
  final String label;
  final bool isSelected;

  ItemChoice({
    required this.id,
    required this.label,
    this.isSelected = false,
  });
}