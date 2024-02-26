import 'package:flutter/material.dart';

class PageItem {
  final String content;
  final List<PageDetailsItem> items;
  final bool active;
  final VoidCallback onPressed;

  const PageItem({
    required this.content,
    required this.active,
    required this.items,
    required this.onPressed,
  });
}

class PageDetailsItem {
  final String title;
  final VideoItem items;
  final VoidCallback onPressed;

  const PageDetailsItem({
    required this.title,
    required this.items,
    required this.onPressed,
  });
}

class VideoItem {
  final String title;
  final String url;
  final VideoItem? nextItem;

  const VideoItem({
    required this.title,
    required this.url,
    required this.nextItem,
  });
}
