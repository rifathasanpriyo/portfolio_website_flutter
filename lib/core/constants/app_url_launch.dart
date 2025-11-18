  import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> openInNewTab(BuildContext context, String url) async {
    // Use url_launcher which supports opening in a new tab on web with webOnlyWindowName
    try {
      await launchUrlString(url, webOnlyWindowName: '_blank');
    } catch (e) {
      // fallback: show a snackbar if launch fails
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open the link')));
    }
  }