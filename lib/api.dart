class API {
  static const hostConnect = 'http://192.168.76.25/e-commerce/';
  static const hostConnectUser = '$hostConnect/auth/';

// Read Konten
static const readPageView = '$hostConnect/readkonten.php';
static const imagePageView = '$hostConnect/promo/'; 


// Authentication
  static const signUp = '$hostConnect/auth/signup.php';
  static const signIn = '$hostConnect/auth/signin.php';
  static const validateEmail = '$hostConnect/auth/validate_email.php';
  static const coba = '$hostConnect/auth/coba.php';

// read data barang
  static const storageImage = '$hostConnect/p/';
  static const allProduk = '$hostConnect/read.php';
  static const getSepatu = '$hostConnect/readkategori5.php';

  static const getKaos = '$hostConnect/readkategori1.php';
}
