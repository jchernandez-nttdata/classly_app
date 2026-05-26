enum StudentsRoutes {
  students('/students', 'students'),
  addStudent('add', 'addStudent'),
  editStudent('edit/:id', 'editStudent')
  ;

  const StudentsRoutes(this.path, this.name);

  final String path;
  final String name;
}
