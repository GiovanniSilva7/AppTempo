class WeatherModel {
      final String title;
      final String description;

      WeatherModel({required this.title, required this.description});

      factory WeatherModel.fromJson(Map<String, dynamic> json) {
        return WeatherModel(
          title: json['title'],
          description: json['description'],
        );
      }

      Map<String, dynamic> toJson() {
        return {
          'title': title,
          'description': description,
        };
      }
    }