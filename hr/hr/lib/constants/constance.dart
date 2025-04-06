import 'package:flutter/material.dart';
import 'package:hr/screens/homeScreens/employee/home_screen.dart';

class AppColor {
  static const backGroundColorWhite = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFF007BFF);

  static const backGroundColorBeige = Color.fromARGB(255, 245, 226, 226);
  static const buttonColor = Color(0xFF007BFF);
}

class FontColor {
  static const fontBlack = Color(0xFF1B1B1B);
  static const fontGreyDark = Color(0xFF666666);
  static const fontGrey = Color(0xFF9A9A9A);
  static const fontGreyLight = Color(0xFFDFDFDF);
  static const fontRed = Color(0xFFDF1414);
}


class AppText {
  // Authentication
  static const String Success = 'Success';
  static const String LOGIN = 'Log in';
  static const String LOGIN_CAPITAL = 'LOG IN';
  static const String WELCOME_BACK = 'Welcome back';
  static const String NEXT = 'NEXT';
  static const String LOGIN_IN_NOW = 'Log in now';
  static const String WAIT_SMS_COD = 'Please wait for an SMS with the code';
  static const String CODE_FROM_SMS = 'Code from the SMS';
  static const String CODE_FROM_EMAIL = 'Code from the E-mail';
  static const String RESIND_CODE = 'Resend the code';
  static const String SEND_CODE = 'SEND A CODE';
  static const String LOGIN_WITH_EMAIL = 'Log in with E-mail';
  static const String LOGIN_WITH_PHONE = 'Log in with Phone number';
  static const String DONT_HAVE_ACCOUNT_SIGNUP = 'Don’t have an account?';
  static const String ALREADY_HAVE_ACCOUNT_LOGIN = 'Already have an account?';
  static const String SIGNUP = 'Sign up';
  static const String UPDATE = 'Update';
  static const String Edit = 'Edit profile';
  static const String SIGNOUT = 'SIGN OUT';
  static const String ACCOUNT = 'Account';
  static const String REGISTER = 'REGISTER';
  static const String FIRST_NAME = 'First Name*';
  static const String LAST_NAME = 'Last Name*';
  static const String password = 'Password*';
  static const String new_password = 'New Password*';
  static const String confirmePassword = 'Confirm New Password*';
  static const String change_password = 'Change Password';
  static const String PHONE_NUMBER = '7 XX XX XX XX';
  static const String E_MAIL = 'E-mail*';
  static const String ERROR = 'Error';

  // Admin
  static const String workTimeSettings = 'Work Time Settings';
  static const String currentStartTime = 'Current Start Time';
  static const String selectStartTime = 'Select Start Time';
  static const String currentEndTime = 'Current End Time';
  static const String selectEndTime = 'Select End Time';
  static const String saveWorkTime = 'Save Work Time';

  // General
  static const String appName = 'MyApp';
  static const String welcome = 'Welcome';
  static const String logout = 'Logout';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';

  // Authentication
  static const String login = 'Login';
  static const String signup = 'Sign Up';
  static const String email = 'Email';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String enterEmail = 'Enter your email';
  static const String enterPassword = 'Enter your password';
  static const String invalidEmail = 'Invalid email address';
  static const String weakPassword = 'Password is too weak';

  // Location
  static const String location = 'Location';
  static const String enterCompanyLocation = 'Enter Company Location';
  static const String invalidLocationFormat = 'Invalid location format';
  static const String locationFormatHint = 'Location must be in the format "latitude longitude"';
  static const String addLocation = 'Please add a location';
  static const String saveLocation = 'Save Location';
  static const String getCurrentLocation = 'Get Current Location';
  static const String locationFormat = 'Location format should be "latitude longitude"';

  // Requests
  static const String manageRequests = 'Manage Requests';
  static const String leaveRequests = 'Leave Requests';
  static const String leaveOutRequests = 'Leave Out Requests';
  static const String noRequests = 'No Requests';
  static const String requestTypeNotSpecified = 'Request Type Not Specified';
  static const String requestReasonNotSpecified = 'Request Reason Not Specified';
  static const String notSpecified = 'Not Specified';
  static const String approve = 'Approve';
  static const String reject = 'Reject';

  // Profile
  static const String profile = 'Profile';
  static const String editProfile = 'Edit Profile';
  static const String updateProfilePicture = 'Update Profile Picture';
  static const String selectPhoto = 'Select Photo';
  static const String takePhoto = 'Take Photo';
  static const String removePhoto = 'Remove Photo';

  // Buttons
  static const String save = 'Save';
  static const String submit = 'Submit';
  static const String delete = 'Delete';

  // Errors
  static const String error = 'Error';
  static const String somethingWentWrong = 'Something went wrong';
  static const String tryAgain = 'Please try again';
  static const String fieldRequired = 'This field is required';

  // Notifications
  static const String notifications = 'Notifications';
  static const String sendNotification = 'Send Notification';
  static const String notificationTitle = 'Notification Title';
  static const String notificationBody = 'Notification Body';

  // Dashboard
  static const String dashboard = 'Dashboard';
  static const String currentDay = 'Current Day';
  static const String noData = 'No Data Available';

  // Others
  static const String search = 'Search';
  static const String settings = 'Settings';
  static const String about = 'About';

  // Arabic Translations
  static const String changePassword = 'Change Password';

  // Admin Dashboard
  static const String adminDashboard = 'Admin Dashboard';
  static const String addCompanyLocation = 'Add Company Location';
  static const String addWorkTime = 'Add Work Time';

  // Admin Notifications Screen
  static const String enterNotificationTitle = 'Please enter notification title';
  static const String enterNotificationBody = 'Please enter notification body';
  static const String noNotifications = 'No notifications available';
  static const String noTitle = 'No Title';
  static const String noMessage = 'No Message';
  static const String confirmDeletion = 'Confirm Deletion';
  static const String confirmDeleteNotification = 'Are you sure you want to delete this notification?';

  // New Screens for Employee
  static const String attendanceRegistration = 'Attendance Registration';
  static const String registerAttendance = 'Register Attendance';
  static const String checkOut = 'Checkout';
  static const String registerCheckOut = 'Register Checkout';
  static const String leaveOutRequest = 'Leave Out Request';
  static const String leaveType = 'Leave Type';
  static const String leaveReason = 'Leave Reason';
  static const String submitRequest = 'Submit Request';

  // Calendar
  static const String calendar = 'Calendar';
  static const String addNewEvent = 'Add New Event';

// Home Screen
  static const String homeScreen = 'Home Screen';
  static const String attendance = 'Attendance';
  static const String leaveRequest = 'Leave Request';
  static const String workTimer = 'Work Timer';

  // Notification Screen
  static const String deleteConfirmationTitle = 'Delete Confirmation';
  static const String deleteConfirmationContent = 'Are you sure you want to delete this notification?';


  // Profile Screen
  static const String edit = 'edit';
  static const String logOut = 'logOut';
  static const String language = 'language';

  // Work Timer Screen
  static const String timer = 'Timer';
  static const String remainingTime = 'Remaining until the end of the workday:';


}


class AppImage {
  ///
  static const logo = 'assets/images/logo.png';
  static const background = 'assets/images/background.jpg';
  static const google = 'assets/images/google.png';
  static const delete = 'assets/images/delete.png';
  static const search = 'assets/images/search.png';
  static const user = 'assets/images/user.png';
  static const drop_down_up_down = 'assets/images/dropDown_up_down.png';
  static const attendance = 'assets/images/attendance.png';
  static const exit = 'assets/images/exit.png';
  static const notification = 'assets/images/notification.png';
  static const timer = 'assets/images/timer.png';
  static const worksheet = 'assets/images/worksheet.png';
  static const changePassword = 'assets/images/reset-password.png';
  static const order = 'assets/images/order.png';
  static const location = 'assets/images/location.png';
  static const edit = 'assets/images/edit.png';

  // json
  static const json_timer = 'assets/lottie/timer.json';
  static const load = 'assets/lottie/load.json';
  static const json_registor= 'assets/lottie/registor.json';
  static const json_log_out= 'assets/lottie/log_out.json';
}


