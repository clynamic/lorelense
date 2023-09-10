import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class GravatarImage extends StatelessWidget {
  const GravatarImage({super.key, required this.email});

  final String email;

  String generateGravatarUrl(String email) {
    email = email.trim().toLowerCase();
    Digest hash = md5.convert(utf8.encode(email));
    return 'https://www.gravatar.com/avatar/$hash';
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: generateGravatarUrl(email),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.warning_amber),
      ),
    );
  }
}
