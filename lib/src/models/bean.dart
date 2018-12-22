class Bean {
  bool error;
  String message;
  List results;

  Bean({this.error, this.message, this.results});

  Bean.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    results = json['results'] ?? List();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Bean{error: $error, message: $message, results: $results}';
  }
}
