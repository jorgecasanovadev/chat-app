extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

String extractEmailUsername(String email) {
  final parts = email.split('@');
  if (parts.length == 2) {
    return parts[0];
  } else {
    // Handle invalid email addresses
    return 'Anonymous';
  }
}
