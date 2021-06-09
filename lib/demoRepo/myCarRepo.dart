import 'package:project_1/model/myCar.dart';

class MyCarRepo {
  List<MyCar> myCars = [
    MyCar(
      name: 'Corolla X',
      color: 'White',
      maker: 'Toyota',
      km: '5000',
      year: '2020',
      price: '\$8500',
      rating: 4,
      imageUrl: 'assets/corolla_x.jpg',
    ),
    MyCar(
      name: 'CR-V',
      color: 'Blue',
      maker: 'Honda',
      km: '6000',
      year: '2020',
      price: '\$16000',
      rating: 4,
      imageUrl: 'assets/crv.jpg',
    ),
  ];
}
