class TestBean {
  int value;
  String label;
  List<sendoBean> children ;

  @override
  String toString() {
    return 'TestBean{value: $value, label: $label, children: $children}';
  }

}
class sendoBean {
  int value;
  String label;

  @override
  String toString() {
    return 'sendoBean{value: $value, label: $label}';
  }

}