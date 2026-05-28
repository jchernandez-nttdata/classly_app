enum ClassesRoutes {
  classes('/classes', 'classes'),
  ;

  const ClassesRoutes(this.path, this.name);

  final String path;
  final String name;
}
