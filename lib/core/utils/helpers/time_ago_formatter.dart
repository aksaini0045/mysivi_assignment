String timeAgoFormatter(DateTime? dateTime) {
  if (dateTime == null) return '';

  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) {
    return 'Just now';
  }

  if (diff.inMinutes < 60) {
    return '${diff.inMinutes} min ago';
  }

  if (diff.inHours < 24) {
    return '${diff.inHours} hrs ago';
  }

  if (diff.inDays == 1) {
    return 'Yesterday';
  }

  return '${diff.inDays} days ago';
}
