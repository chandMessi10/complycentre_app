extension StringExtenstions on String {
  String getInitials() {
    if (isEmpty) return '';
    final strList = split(' ');
    final initials = strList.map((str) => str[0]).toList().join("");
    return initials.toUpperCase();
  }
}
