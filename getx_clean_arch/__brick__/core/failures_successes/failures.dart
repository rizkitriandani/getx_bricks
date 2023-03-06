abstract class Failure {
  final String? message;
  const Failure({
    this.message,
  });
}

class FetchFailure extends Failure {
  const FetchFailure({super.message});
}
