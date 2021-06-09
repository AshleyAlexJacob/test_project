import 'package:project_1/model/client.dart';

class NotificationRepo {
  List<Client> client = [
    Client(
        fullName: 'Arbab Shujaat',
        clientImage: 'assets/p1.jpg',
        hasBooked: true),
    Client(fullName: 'Ali Khan', clientImage: 'assets/p2.jpg', hasBooked: true),
  ];
}
