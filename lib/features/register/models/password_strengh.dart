enum PasswordStrength {
  weak('Weak'),
  fair('Fair'),
  good('Good'),
  great('Great');

  const PasswordStrength(this.label);

  final String label;
}
