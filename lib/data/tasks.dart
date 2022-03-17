import '../models/task.dart';
import 'package:faker/faker.dart';
   
var faker = Faker();

var tasks = List<Task>.generate(15, (id) {
    return Task(
      id,
      faker.lorem.word(),
      random.boolean(),
      faker.date.dateTime(minYear: 2020, maxYear: 2021)
    );
  });