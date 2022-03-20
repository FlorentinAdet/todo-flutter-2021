import '../models/task.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

var faker = Faker();

var tasks = List<Task>.generate(5, (id) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    String dateString = dateFormat.format(faker.date.dateTime(minYear: 2020, maxYear: 2021));
    DateTime dateTime = dateFormat.parse(dateString);
    return Task(
      id,
      faker.lorem.word(),
      random.boolean(),
      dateTime
    );
  });