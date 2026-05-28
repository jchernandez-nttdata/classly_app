enum ClassesRoutes {
  classes('/classes', 'classes'),
  scheduleDetail(':scheduleId', 'scheduleDetail')
  ;

  const ClassesRoutes(this.path, this.name);

  final String path;
  final String name;
}
