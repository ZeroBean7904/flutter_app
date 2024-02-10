class Performance {
  int id =0;
  String date = '';
  String description = '';
  int duration = 0;

  Performance(this.id, this.date, this.description, this.duration);

  Performance.fromJson(Map<String, dynamic> PerformanceMap){
    id = PerformanceMap['id'] ?? 0;
    date = PerformanceMap['date'] ?? '';
    description = PerformanceMap['description'] ?? '';
    duration = PerformanceMap['duration'] ?? 0;
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'date' : date,
      'description' : description,
      'duration' : duration,
    };
  }
}