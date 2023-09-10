import 'dart:async';
import 'dart:convert';

import 'package:clynamic/project.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' hide delete, get, post, put;
import 'package:http/http.dart' as http show get;

/// App-wide http client for all requests.
///
/// Memoizes requests to prevent unnecessary network calls.
class Client {
  final Map<Uri, Response> _cache = {};

  /// Fetches a GitHub project.
  Future<GithubProject> fetchGitHubProject(String owner, String repo) async {
    Uri url = Uri.parse('https://api.github.com/repos/$owner/$repo');
    Response response = await _cache.request(url, () => http.get(url));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        message: 'Failed to fetch GitHub project',
        reason: response.reasonPhrase,
        statusCode: response.statusCode,
      );
    }

    String? banner;
    try {
      banner = await fetchGithubSocialPreview(owner, repo);
    } on HttpException {
      // no banner
    }

    final Map<String, dynamic> data = json.decode(response.body);
    return GithubProject(
      title: data['name'],
      description: data['description'],
      stars: data['stargazers_count'],
      lastCommit: data['pushed_at'],
      website: data['homepage'],
      language: data['language'],
      banner: banner,
    );
  }

  /// Fetches a GitHub social preview image.
  Future<String?> fetchGithubSocialPreview(String owner, String repo) async {
    final url = Uri.parse('https://github.com/$owner/$repo');
    Response response = await _cache.request(url, () => http.get(url));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        message: 'Failed to fetch GitHub social preview',
        reason: response.reasonPhrase,
        statusCode: response.statusCode,
      );
    }

    dom.Document document = html.parse(response.body);
    dom.Element? metaTag = document.querySelector('meta[property="og:image"]');
    return metaTag?.attributes['content'];
  }
}

extension AsyncMapCachingExtension<K, V> on Map<K, V> {
  FutureOr<V> request(K key, FutureOr<V> Function() ifAbsent) async {
    if (!containsKey(key)) {
      this[key] = await ifAbsent();
    }
    return this[key]!;
  }
}

/// Thrown when an HTTP request fails.
class HttpException implements Exception {
  HttpException({
    required this.message,
    this.reason,
    required this.statusCode,
  });

  final String message;
  final String? reason;
  final int statusCode;

  @override
  String toString() => 'HttpException: $message ($statusCode)';
}

/// Provides a [Client] to a subtree.
class ClientProvider extends StatefulWidget {
  const ClientProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  /// Returns the [Client] from the nearest [ClientProvider] ancestor.
  static Client of(BuildContext context) => maybeOf(context)!;

  /// Returns the [Client] from the nearest [ClientProvider] ancestor, or null
  static Client? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ClientProviderState>()?._client;

  @override
  State<ClientProvider> createState() => _ClientProviderState();
}

class _ClientProviderState extends State<ClientProvider> {
  final Client _client = Client();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
