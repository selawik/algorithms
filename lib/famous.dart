/// Задача:
/// Найти в списке известного Person - кто бы не знал никого (contactIds.isEmpty)
/// и все остальные Person в списке знали бы его (имели в contactIds его id)
/// Подразумеваю, что люди в списке уникальны (id уникальны)
///

class Person {
  final int id;

  final Set<int> contactIds;

  const Person(
    this.id,
    this.contactIds,
  );

  @override
  String toString() {
    return 'Person with id = $id and contacts = ${contactIds}';
  }
}

void main() {
  final persons = <Person>[
    Person(1, {2, 3, 4}),
    Person(2, {3}),
    Person(3, {}),
    Person(4, {1, 3, 2}),
  ];

  final realFamousPeople = findFamousPeople(persons);

  print(
    realFamousPeople == null
        ? 'Famous people not found'
        : '$realFamousPeople is famous',
  );
}

Person? findFamousPeople(List<Person> persons) {
  final int relationsCountToBeFamous = persons.length - 1;
  final Map<int, Set<int>> personsRelations = {};
  Person? personWithNoContacts;

  for (final person in persons) {
    if (person.contactIds.isEmpty) {
      personWithNoContacts = person;
      continue;
    }

    for (final contactId in person.contactIds) {
      if (personsRelations[contactId] == null) {
        personsRelations[contactId] = {person.id};
      } else {
        personsRelations[contactId]!.add(person.id);
      }
    }
  }

  if (personWithNoContacts != null &&
      personsRelations[personWithNoContacts.id]?.length ==
          relationsCountToBeFamous) {
    return personWithNoContacts;
  }

  return null;
}
