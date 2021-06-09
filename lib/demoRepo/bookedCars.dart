import 'package:project_1/model/bookCar.dart';
import 'package:project_1/model/car.dart';

class BookedCarRepo {
  List<BookCar> bookCars = [
    BookCar(
      bookDate: '10/05/2021',
      returnDate: '2/06/2021',
      carDetail: Car(
        name: 'A4',
        color: 'Silver',
        maker: 'Audi',
        km: '1500',
        year: '2020',
        price: '\$28000',
        rating: 4,
        imageUrl: 'assets/a4.jpg',
        favorite: false,
      ),
    ),
    BookCar(
      bookDate: '15/05/2021',
      returnDate: '4/06/2021',
      carDetail: Car(
        name: 'Corolla X',
        color: 'White',
        maker: 'Toyota',
        km: '5000',
        year: '2020',
        price: '\$8500',
        rating: 4,
        imageUrl: 'assets/corolla_x.jpg',
        favorite: false,
      ),
    ),
  ];
}
