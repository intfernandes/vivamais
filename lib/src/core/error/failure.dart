abstract class Failure {}

class ServerFailure implements Failure {}

class BadRequestFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class ForbiddenFailure extends Failure {}

class DefaultFailure extends Failure {}

class DuplicateUserFailure extends Failure {}

class DuplicatePhoneFailure extends Failure {}
