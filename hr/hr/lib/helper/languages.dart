import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_u': {
      "Remaining until the end of the workday:":"Remaining until the end of the workday:",
      "No notifications available":"No notifications available",

      // Authentication
      'Success': 'Success',
      'Log in': 'Log in',
      'LOG IN': 'LOG IN',
      'Welcome back': 'Welcome back',
      'NEXT': 'NEXT',
      'Log in now': 'Log in now',
      'Please wait for an SMS with the code': 'Please wait for an SMS with the code',
      'Code from the SMS': 'Code from the SMS',
      'Code from the E-mail': 'Code from the E-mail',
      'Resend the code': 'Resend the code',
      'SEND A CODE': 'SEND A CODE',
      'Log in with E-mail': 'Log in with E-mail',
      'Log in with Phone number': 'Log in with Phone number',
      'Don’t have an account?': 'Don’t have an account?',
      'Already have an account?': 'Already have an account?',
      'Sign up': 'Sign up',
      'Update': 'Update',
      'Edit profile': 'Edit profile',
      'SIGN OUT': 'SIGN OUT',
      'Account': 'Account',
      'REGISTER': 'REGISTER',
      'First Name*': 'First Name*',
      'Last Name*': 'Last Name*',
      'Password*': 'Password*',
      'New Password*': 'New Password*',
      'Confirm New Password*': 'Confirm New Password*',
      'Change Password': 'Change Password',
      '7 XX XX XX XX': '7 XX XX XX XX',
      'E-mail*': 'E-mail*',
      'Error': 'Error',

      // Admin
      'Work Time Settings': 'Work Time Settings',
      'Current Start Time': 'Current Start Time',
      'Select Start Time': 'Select Start Time',
      'Current End Time': 'Current End Time',
      'Select End Time': 'Select End Time',
      'Save Work Time': 'Save Work Time',

      // General
      'MyApp': 'MyApp',
      'Welcome': 'Welcome',
      'Logout': 'Logout',
      'Cancel': 'Cancel',
      'Confirm': 'Confirm',

      // Authentication
      'Login': 'Login',
      'Sign Up': 'Sign Up',
      'Email': 'Email',
      'Forgot Password?': 'Forgot Password?',
      'Reset Password': 'Reset Password',
      'Enter your email': 'Enter your email',
      'Enter your password': 'Enter your password',
      'Invalid email address': 'Invalid email address',
      'Password is too weak': 'Password is too weak',

      // Location
      'Location': 'Location',
      'Enter Company Location': 'Enter Company Location',
      'Invalid location format': 'Invalid location format',
      'Location must be in the format "latitude longitude"': 'Location must be in the format "latitude longitude"',
      'Please add a location': 'Please add a location',
      'Save Location': 'Save Location',
      'Get Current Location': 'Get Current Location',
      'Location format should be "latitude longitude"': 'Location format should be "latitude longitude"',

      // Requests
      'Manage Requests': 'Manage Requests',
      'Leave Requests': 'Leave Requests',
      'Leave Out Requests': 'Leave Out Requests',
      'No Requests': 'No Requests',
      'Request Type Not Specified': 'Request Type Not Specified',
      'Request Reason Not Specified': 'Request Reason Not Specified',
      'Not Specified': 'Not Specified',
      'Approve': 'Approve',
      'Reject': 'Reject',

      // Profile
      'Profile': 'Profile',
      'language': 'language',
      'Edit Profile': 'Edit Profile',
      'Update Profile Picture': 'Update Profile Picture',
      'Select Photo': 'Select Photo',
      'Take Photo': 'Take Photo',
      'Remove Photo': 'Remove Photo',

      // Buttons
      'Save': 'Save',
      'Submit': 'Submit',
      'Delete': 'Delete',

      // Errors
      'Error': 'Error',
      'Something went wrong': 'Something went wrong',
      'Please try again': 'Please try again',
      'This field is required': 'This field is required',

      // Notifications
      'Notifications': 'Notifications',
      'Send Notification': 'Send Notification',
      'Notification Title': 'Notification Title',
      'Notification Body': 'Notification Body',

      // Dashboard
      'Dashboard': 'Dashboard',
      'Current Day': 'Current Day',
      'No Data Available': 'No Data Available',

      // Others
      'Search': 'Search',
      'Settings': 'Settings',
      'About': 'About',

      // New Screens for Employee
      'Attendance Registration': 'Attendance Registration',
      'Register Attendance': 'Register Attendance',
      'Checkout': 'Checkout',
      'Register Checkout': 'Register Checkout',
      'Leave Out Request': 'Leave Out Request',
      'Leave Type': 'Leave Type',
      'Leave Reason': 'Leave Reason',
      'Submit Request': 'Submit Request',

      // Calendar
      'Calendar': 'Calendar',
      'Add New Event': 'Add New Event',

      // Home Screen
      'Home Screen': 'Home Screen',
      'Attendance': 'Attendance',
      'Leave Request': 'Leave Request',
      'Work Timer': 'Work Timer',
      'Timer': 'Timer',
      'Add Work Time': 'Add Work Time',
      'Add Company Location': 'Add Company Location',
      'Admin Dashboard': 'Admin Dashboard',
      "Continue using Google":"Continue using Google",

      // Notification Screen
      'Delete Confirmation': 'Delete Confirmation',
      'Are you sure you want to delete this notification?': 'Are you sure you want to delete this notification?',

      // SnackBar
      'verification_failed': 'Verification failed.',
      'verification_code_sent': 'Verification code sent.',
      'error_during_verification': 'Error during phone number verification.',
      'phone_number_in_use': 'Phone number is already in use.',
      'user_document_not_exists': 'User document does not exist.',
      'failed_to_retrieve_token': 'Failed to retrieve token.',
      'sign_up_successful': 'Sign up successful.',
      'signed_in_successfully': 'Signed in successfully.',
      'error_signing_up': 'Error signing up.',
      'error_signing_in': 'Error signing in.',
      'error_updating_document': 'Error updating document.',
      'google_sign_in_successful': 'Google Sign-In successful.',
      'google_sign_in_failed': 'Google Sign-In failed.',
      'error_during_google_sign_in': 'Error during Google Sign-In.',
      'no_user_signed_in': 'No user is currently signed in.',
      'password_changed_successfully': 'Password changed successfully.',
      'error_changing_password': 'Error changing password.',
      'wrong_password': 'The current password is incorrect.',
      'weak_password': 'The new password is too weak.',
      'logout_successful': 'Logout successful.',
      'error_logging_out': 'Error logging out.',

      'location_services_disabled': 'Location services are disabled.',
      'location_permissions_denied': 'Location permissions are denied.',
      'location_permissions_denied_forever': 'Location permissions are permanently denied, we cannot request permissions.',
      'invalid_position_data': 'Invalid position data.',
      'location_updated_successfully': 'Location updated successfully.',
      'failed_to_update_location': 'Failed to update location',

      // ManageRequestsController
      'error_fetching_requests': 'Error fetching requests.',
      'failed_to_fetch_requests': 'Failed to fetch requests: {error}',
      'error_no_data_found': 'No data found for the specified request.',
      'request_approved_successfully': 'Request approved successfully.',
      'failed_to_approve_request': 'Failed to approve request: {error}',
      'request_rejected_successfully': 'Request rejected successfully.',
      'failed_to_reject_request': 'Failed to reject request: {error}',

      // AttendanceController Snackbars
      'failed_to_get_user_data': 'Failed to get user data: {error}',
      'failed_to_get_work_time': 'Failed to get work time: {error}',
      'failed_to_get_company_location': 'Failed to get company location: {error}',
      'must_be_near_company_to_check_in': 'You must be near the company to check in.',
      'can_only_check_in_during_work_hours': 'You can only check in during work hours.',
      'failed_to_get_current_position': 'Failed to get current position.',
      'an_error_occurred_retrieving_current_location': 'An error occurred while retrieving the current location.',
      'please_grant_location_access_permission': 'Please grant location access permission.',
      'please_enable_location_access_in_phone_settings': 'Please enable location access in phone settings.',
      'no_location_permission': 'No location permission granted.',
      'work_hour_not_found': 'Work hour not found for today.',
      'not_in_allowed_area_for_checkout': 'You are not in the allowed area for checkout.',
      'checkout_failed': 'Failed to check out: {error}',
      'checked_in_successfully': 'Checked in successfully.',
      'checked_out_successfully': 'Checked out successfully.',
      'attendance_already_registered': 'Attendance already registered for today.',
      'check_out_only_after_check_in': 'You can only check out after checking in.',
    },
    'ar_u': {
      "Remaining until the end of the workday:":"الوقت المتبقي حتى نهاية يوم العمل:",
      "No notifications available":"لا توجد إشعارات متاحة",

      // Authentication
      'Success': 'نجاح',
      'Log in': 'تسجيل الدخول',
      'LOG IN': 'تسجيل الدخول',
      'Welcome back': 'مرحبًا بعودتك',
      'NEXT': 'التالي',
      'Log in now': 'تسجيل الدخول الآن',
      'Please wait for an SMS with the code': 'يرجى الانتظار للحصول على رسالة نصية بالرمز',
      'Code from the SMS': 'الرمز من الرسالة النصية',
      'Code from the E-mail': 'الرمز من البريد الإلكتروني',
      'Resend the code': 'إعادة إرسال الرمز',
      'SEND A CODE': 'إرسال رمز',
      'Log in with E-mail': 'تسجيل الدخول عبر البريد الإلكتروني',
      'Log in with Phone number': 'تسجيل الدخول عبر رقم الهاتف',
      'Don’t have an account?': 'لا تمتلك حسابًا؟',
      'Already have an account?': 'هل لديك حساب بالفعل؟',
      'Sign up': 'التسجيل',
      'Update': 'تحديث',
      'Edit profile': 'تعديل الملف الشخصي',
      'SIGN OUT': 'تسجيل الخروج',
      'Account': 'الحساب',
      'REGISTER': 'تسجيل',
      'First Name*': 'الاسم الأول*',
      'Last Name*': 'اسم العائلة*',
      'Password*': 'كلمة المرور*',
      'New Password*': 'كلمة مرور جديدة*',
      'Confirm New Password*': 'تأكيد كلمة المرور الجديدة*',
      'Change Password': 'تغيير كلمة المرور',
      '7 XX XX XX XX': '7 XX XX XX XX',
      'E-mail*': 'البريد الإلكتروني*',
      'Error': 'خطأ',

      // Admin
      'Work Time Settings': 'إعدادات وقت العمل',
      'Current Start Time': 'وقت البدء الحالي',
      'Select Start Time': 'حدد وقت البدء',
      'Current End Time': 'وقت الانتهاء الحالي',
      'Select End Time': 'حدد وقت الانتهاء',
      'Save Work Time': 'حفظ وقت العمل',

      // General
      'MyApp': 'تطبيقي',
      'Welcome': 'مرحبا',
      'Logout': 'تسجيل الخروج',
      'Cancel': 'إلغاء',
      'Confirm': 'تأكيد',

      // Authentication
      'Login': 'تسجيل الدخول',
      'Sign Up': 'التسجيل',
      'Email': 'البريد الإلكتروني',
      'Forgot Password?': 'نسيت كلمة المرور؟',
      'Reset Password': 'إعادة تعيين كلمة المرور',
      'Enter your email': 'أدخل بريدك الإلكتروني',
      'Enter your password': 'أدخل كلمة المرور',
      'Invalid email address': 'عنوان بريد إلكتروني غير صالح',
      'Password is too weak': 'كلمة المرور ضعيفة جدًا',

      // Location
      'Location': 'الموقع',
      'Enter Company Location': 'أدخل موقع الشركة',
      'Invalid location format': 'تنسيق الموقع غير صالح',
      'Location must be in the format "latitude longitude"': 'يجب أن يكون الموقع بتنسيق "خط العرض خط الطول"',
      'Please add a location': 'يرجى إضافة موقع',
      'Save Location': 'حفظ الموقع',
      'Get Current Location': 'احصل على الموقع الحالي',
      'Location format should be "latitude longitude"': 'يجب أن يكون تنسيق الموقع "خط العرض خط الطول"',

      // Requests
      'Manage Requests': 'إدارة الطلبات',
      'Leave Requests': 'طلبات الإجازة',
      'Leave Out Requests': 'طلبات الخروج',
      'No Requests': 'لا توجد طلبات',
      'Request Type Not Specified': 'نوع الطلب غير محدد',
      'Request Reason Not Specified': 'سبب الطلب غير محدد',
      'Not Specified': 'غير محدد',
      'Approve': 'موافقة',
      'Reject': 'رفض',

      // Profile
      'Profile': 'الملف الشخصي',
      'language': 'اللغة',
      'Edit Profile': 'تعديل الملف الشخصي',
      'Update Profile Picture': 'تحديث صورة الملف الشخصي',
      'Select Photo': 'اختر صورة',
      'Take Photo': 'التقاط صورة',
      'Remove Photo': 'إزالة الصورة',

      // Buttons
      'Save': 'حفظ',
      'Submit': 'إرسال',
      'Delete': 'حذف',

      // Errors
      'Error': 'خطأ',
      'Something went wrong': 'حدث خطأ ما',
      'Please try again': 'يرجى المحاولة مرة أخرى',
      'This field is required': 'هذا الحقل مطلوب',

      // Notifications
      'Notifications': 'الإشعارات',
      'Send Notification': 'إرسال إشعار',
      'Notification Title': 'عنوان الإشعار',
      'Notification Body': 'محتوى الإشعار',

      // Dashboard
      'Dashboard': 'اللوحة الرئيسية',
      'Current Day': 'اليوم الحالي',
      'No Data Available': 'لا توجد بيانات متاحة',

      // Others
      'Search': 'بحث',
      'Settings': 'الإعدادات',
      'About': 'معلومات',

      // New Screens for Employee
      'Attendance Registration': 'تسجيل الحضور',
      'Register Attendance': 'تسجيل الحضور',
      'Checkout': 'تسجيل الخروج',
      'Register Checkout': 'تسجيل الخروج',
      'Leave Out Request': 'طلب الخروج',
      'Leave Type': 'نوع الإجازة',
      'Leave Reason': 'سبب الإجازة',
      'Submit Request': 'إرسال الطلب',

      // Calendar
      'Calendar': 'التقويم',
      'Add New Event': 'إضافة حدث جديد',

      // Home Screen
      'Home Screen': 'الشاشة الرئيسية',
      'Attendance': 'الحضور',
      'Leave Request': 'طلب إجازة',
      'Work Timer': 'مؤقت العمل',
      'Timer': 'مؤقت',
      'Add Work Time': 'إضافة وقت العمل',
      'Add Company Location': 'إضافة موقع الشركة',
      'Admin Dashboard': 'لوحة إدارة المشرفين',
      "Continue using Google":"تابع باستخدام جوجل",

      // Notification Screen
      'Delete Confirmation': 'تأكيد الحذف',
      'Are you sure you want to delete this notification?': 'هل أنت متأكد أنك تريد حذف هذا الإشعار؟',

      // SnackBar
      'verification_failed': 'فشل التحقق.',
      'verification_code_sent': 'تم إرسال رمز التحقق.',
      'error_during_verification': 'خطأ أثناء التحقق من رقم الهاتف.',
      'phone_number_in_use': 'رقم الهاتف قيد الاستخدام بالفعل.',
      'user_document_not_exists': 'وثيقة المستخدم غير موجودة.',
      'failed_to_retrieve_token': 'فشل في استرداد الرمز.',
      'sign_up_successful': 'تم التسجيل بنجاح.',
      'signed_in_successfully': 'تم تسجيل الدخول بنجاح.',
      'error_signing_up': 'خطأ في التسجيل.',
      'error_signing_in': 'خطأ في تسجيل الدخول.',
      'error_updating_document': 'خطأ في تحديث الوثيقة.',
      'google_sign_in_successful': 'تم تسجيل الدخول باستخدام جوجل بنجاح.',
      'google_sign_in_failed': 'فشل تسجيل الدخول باستخدام جوجل.',
      'error_during_google_sign_in': 'خطأ أثناء تسجيل الدخول باستخدام جوجل.',
      'no_user_signed_in': 'لا يوجد مستخدم مسجل الدخول حاليًا.',
      'password_changed_successfully': 'تم تغيير كلمة المرور بنجاح.',
      'error_changing_password': 'خطأ في تغيير كلمة المرور.',
      'wrong_password': 'كلمة المرور الحالية غير صحيحة.',
      'weak_password': 'كلمة المرور الجديدة ضعيفة جدًا.',
      'logout_successful': 'تم تسجيل الخروج بنجاح.',
      'error_logging_out': 'خطأ في تسجيل الخروج.',

      'location_services_disabled': 'خدمات الموقع معطلة.',
      'location_permissions_denied': 'أذونات الموقع مرفوضة.',
      'location_permissions_denied_forever': 'أذونات الموقع مرفوضة بشكل دائم، لا يمكننا طلب الأذونات.',
      'invalid_position_data': 'بيانات الموقع غير صالحة.',
      'location_updated_successfully': 'تم تحديث الموقع بنجاح.',
      'failed_to_update_location': 'فشل في تحديث الموقع',

      // ManageRequestsController
      'error_fetching_requests': 'خطأ في جلب الطلبات.',
      'failed_to_fetch_requests': 'فشل في جلب الطلبات: {error}',
      'error_no_data_found': 'لم يتم العثور على بيانات للطلب المحدد.',
      'request_approved_successfully': 'تمت الموافقة على الطلب بنجاح.',
      'request_rejected_successfully': 'تم رفض الطلب بنجاح.',
      'failed_to_approve_request': 'فشل في الموافقة على الطلب: {error}',
      'failed_to_reject_request': 'فشل في رفض الطلب: {error}',

      // Work Timer Screen
      'remaining_time': 'الوقت المتبقي',
      'time_end': 'نهاية الوقت',
      'work_time': 'وقت العمل',
      'start_time': 'وقت البدء',
      'end_time': 'وقت الانتهاء',
      'work_hours': 'ساعات العمل',

      // Attendance Errors
      'location_permission': 'لم يتم منح إذن الموقع.',
      'work_hour_not_found': 'لم يتم العثور على ساعات العمل لليوم.',
      'not_in_allowed_area_for_checkout': 'أنت لست في المنطقة المسموح بها لتسجيل الخروج.',
      'checkout_failed': 'فشل في تسجيل الخروج: {error}',
      'checked_in_successfully': 'تم تسجيل الدخول بنجاح.',
      'check_out_successfully': 'تم تسجيل الخروج بنجاح.',
      'attendance_already_registered': 'تم تسجيل الحضور بالفعل لليوم.',
      'check_out_only_after_check_in': 'يمكنك تسجيل الخروج فقط بعد تسجيل الدخول.',
      ///
      'location_services_disabled': 'خدمات الموقع غير مفعل.',
      'location_permissions_denied': 'أذونات الموقع مرفوضة.',
      'location_permissions_denied_forever': 'أذونات الموقع مرفوضة بشكل دائم، لا يمكننا طلب الأذونات.',
      'invalid_position_data': 'بيانات الموقع غير صالحة.',
      'location_updated_successfully': 'تم تحديث الموقع بنجاح.',
      'failed_to_update_location': 'فشل في تحديث الموقع',

      ///


      // ManageRequestsController
      'error_fetching_requests': 'خطأ في جلب الطلبات.',
      'failed_to_fetch_requests': 'فشل في جلب الطلبات: {error}',
      'error_no_data_found': 'لم يتم العثور على البيانات للطلب المحدد.',
      'request_approved_successfully': 'تم قبول الطلب بنجاح.',
      'failed_to_approve_request': 'فشل في قبول الطلب: {error}',
      'request_rejected_successfully': 'تم رفض الطلب بنجاح.',
      'failed_to_reject_request': 'فشل في رفض الطلب: {error}',
      'notification_send_failed': 'فشل إرسال الإشعار لأن رمز FCM غير متوفر.',

      ///
      'failed_to_get_user_data': 'فشل في الحصول على بيانات المستخدم',
      'failed_to_get_work_time': 'فشل في الحصول على وقت العمل',
      'failed_to_get_company_location': 'فشل في الحصول على موقع الشركة',
      'must_be_near_company_to_check_in': 'يجب أن تكون بالقرب من الشركة لتسجيل الدخول',
      'can_only_check_in_during_work_hours': 'يمكنك التسجيل فقط خلال ساعات العمل',
      'an_error_occurred_retrieving_current_location': 'حدث خطأ أثناء استرجاع الموقع الحالي.',
      'please_grant_location_access_permission': 'يرجى منح إذن الوصول إلى الموقع',
      'please_enable_location_access_in_phone_settings': 'يرجى تفعيل الوصول إلى الموقع في إعدادات الهاتف',
      'checked_in_successfully': 'تم تسجيل الدخول بنجاح',
      'You have already registered': 'لقد قمت بتسجيل بالفعل',
      'You are logged out today': 'لقد قمت بتسجيل الخروج',
      'checked_out_successfully': 'تم تسجيل الخروج بنجاح',
      'no_check_in_record_found_for_today': 'لم يتم العثور على سجل تسجيل الدخول لليوم',
      'can_only_check_out_on_same_day': 'يمكنك الخروج فقط في نفس اليوم الذي سجلت فيه الدخول',

      ///
      'leave_request_submitted_successfully': 'تم إرسال طلب الإجازة بنجاح',
      'leave_out_request_submitted_successfully': 'تم إرسال طلب المغادرة بنجاح',


      ///
      'fetch_notifications_failed': 'فشل في جلب الإشعارات',
      'delete_notification_failed': 'فشل في حذف الإشعار',
      'notification_deleted_successfully': 'تم حذف الإشعار بنجاح',

      ///
      'fetch_work_time_failed': 'فشل في جلب وقت العمل',
      'update_work_time_failed': 'فشل في تحديث وقت العمل',
      'work_time_updated_successfully': 'تم تحديث وقت العمل بنجاح',

      /// profile
      'edit': 'تعديل',
      'logOut': 'تسجيل الخروج',
      'language': 'اللغة',

    },
  };

}
