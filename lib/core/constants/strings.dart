class Strings {
  // App
  static const appTitle = 'Hash Store';

  //images paths
  static const splashImage = 'assets/images/splash_image.jpg';
  static const msgImage = 'assets/images/msg_image.svg';
  static const filterIcon = 'assets/images/filter_icon.svg';
  static const assetsIcon = 'assets/images/assets_icon.svg';
  static const hashRateIcon = 'assets/images/hash_rate_icon.svg';
  static const devicesIcon = 'assets/images/devices_icon.svg';
  static const userImage = 'assets/images/user_image.jpg';
  static const miningIcon = 'assets/images/mining_icon.svg';
  static const liteMainersImage = 'assets/images/lite_miners.svg';
  static const regularMinersImage = 'assets/images/regular_miners_image.svg';
  static const proMinersImage = 'assets/images/pro_miners_image.svg';
  static const eliteMinersImage = 'assets/images/elite_miners_image.svg';
  static const btcIcon = 'assets/images/btc_icon.png';
  static const ethIcon = 'assets/images/eth_icon.png';
  static const rvnIcon = 'assets/images/rvn_icon.png';
  static const ltctIcon = 'assets/images/ltct_icon.png';
  static const featherChevronDownIcon =
      'assets/images/feather_chevron_down_icon.svg';
  static const arrowUpRightIcon = 'assets/images/arrow-up-right.svg';
  static const plusIcon = 'assets/images/plus.svg';
  static const featherChevronUp = 'assets/images/feather_chevron_up.svg';
  static const minerImage = 'assets/images/antMinerE9_image.png';

  //API
  static const baseUrl = 'https://cominer.herokuapp.com/api/';
  static const apiKey =
      'c3fe929c35dd0cbcc8f062bb60e9d2ce7d14be21513d07c53e370d81ba9de4a4';
  static const signUpEndPoint = 'user/register';
  static const deleteAccountEndPoint = 'user/deleteAccount';
  static const fLoginEndPoint = 'user/FFactorAuth';
  static const sLoginEndPoint = 'user/TwoFactorAuth';
  static const forgetPasswordEndPoint = 'user/forgetPassword';
  static const verifyCodeEndPoint = 'user/verifyCode';
  static const resetPasswordEndPoint = 'user/resetPassword';
  static const logoutEndPoint = 'user/logout';
  static const getNewAccessTokenEndPoint = 'user/getNewAccessToken';
  static const updatePasswordEndPoint = 'user/updatePassword';
  static const getPlanContractEndPoint = 'plan/x/contract';
  static const getUserDataEndPoint = 'user/getUserData';
  static const addPlanContractEndPoint = 'plan/x/contract/add';
  static const getAsicsEndPoint = 'asic';
  static const addAsicContractEndPoint = 'asic/x/contract/add';
  static const getAsicContractEndPoint = 'asic/x/contract';
  static const getWithdrawsEndpoint = 'transaction/getwithdraws';
  static const withdrawRequestEndPoint = 'transaction/setwithdrawrequest';
  static const getDepositsEndpoint = 'transaction/getdeposits';

  //error messages
  static const defaultErrorMessage = 'Sorry, an error occurred';
  static const noInternetErrorMessage = 'Check your internet connection';
  static const loginSessionError = 'Your login session has expired.';
}
