class Config {
  static const String _baseFunctionUrl =
      'https://daelim-server.fleecy.dev/functions/v1';
  static const icon = (
    Google:
        'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/apple.png',
    Apple:
        'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/github.png',
    Github:
        'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/google.png',
  );

  static const image =
      (defaultProfileImageUrl: '$_storagePublicUrl/icons/user.png',);

  static final api = (
    getToken: '$_baseFunctionUrl/auth/get-token',
    getUserData: '$_baseFunctionUrl/auth/my-data',
    getProfileImage: '$_baseFunctionUrl/auth/set-profile-image',
    changePassword: '$_baseFunctionUrl/auth/reset-password',
  );
}

const String baseUrl = 'https://daelim-server.fleecy.dev/functions/v1';
const String getTokenUrl = '$baseUrl/auth/get-token';
const String getUserDataUrl = '$baseUrl/auth/my-data';
const String setProfileImageUrl = '$baseUrl/auth/set-profile-image';

const String _storagePublicUrl =
    'https://daelim-server.fleecy.dev/storage/v1/object/public';

const String icGoogle =
    'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/apple.png';
const String icApple =
    'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/github.png';
const String icGithub =
    'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/google.png';
const String icUser =
    'https://daelim-server.fleecy.dev/storage/v1/object/public/icons/user.png';
const String defaultProfileImageUrl = '$_storagePublicUrl/icons/user.png';
