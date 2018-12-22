class PageChange {
  final int page;
  final bool triggeredByBack;

  PageChange(this.page, {this.triggeredByBack = false});

  @override
  String toString() {
    return 'PageChange{page: $page, triggeredByBack: $triggeredByBack}';
  }
}
