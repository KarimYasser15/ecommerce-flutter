abstract class AppException {
  const AppException(this.message);

  final String message;
}

class RemoteException extends AppException {
  const RemoteException(super.message);
}

class LocalException extends AppException {
  const LocalException(super.message);
}
