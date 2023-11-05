import 'package:clynamic/app/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyUsernameDialog extends StatelessWidget {
  const CopyUsernameDialog({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            key: Key(username),
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: username,
                selection: TextSelection(
                  baseOffset: 0,
                  extentOffset: username.length,
                ),
              ),
            ),
            readOnly: true,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Username',
              suffixIcon: IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy to clipboard',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: username));
                  Alerts.of(context).add(
                    Alert.info(
                      message: Text('Copied $username to clipboard.'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
