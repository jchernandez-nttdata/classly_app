/// Defines the routes for the authentication feature.
enum AuthRoutes {
  /// The login page route.
  login('/login')
  ;

  /// Creates a new instance of [AuthRoutes] with the given [path].
  const AuthRoutes(this.path);

  /// The path of the route.
  final String path;
}
