enum ActivityStatus { ongoing, done }

class Activity {
  String name;
  String image;
  String? id;
  String city;
  double price;
  ActivityStatus status;

  Activity(
      {required this.city,
      required this.name,
      this.id,
      required this.image,
      required this.price})
      : status = ActivityStatus.ongoing;

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        image = json['image'],
        city = json['city'],
        price = json['price'].toDouble(),
        status =
        json['status'] == 0 ? ActivityStatus.ongoing : ActivityStatus.done;
}
