enum PassengersType {
  old,
  adult,
  child,
  infant;

  String resolveTitle() => switch (this) {
        old => 'Old',
        adult => 'Adult',
        child => 'Child',
        infant => 'Infant',
      };

  String resolveSubtitle() => switch (this) {
        old => 'Age 60+',
        adult => 'Age 18+',
        child => 'Age 4-8',
        infant => 'Bellow age 4',
      };
}
