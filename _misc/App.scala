class HelloWorld extends Controller {

  get("/hello/:name") { request =>
    val name = request.routeParams("name").getOrElse("default user")
    render.plain("hello " + name).toFuture
  }

}

object App extends FinatraServer {
  register(new HelloWorld())
}
