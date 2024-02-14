// ignore_for_file: file_names

class EndPoints {

  static String getUserInfo = "auth/user-profile";

  //? Centers apis
  static String getAllCenters = "PersonApp/all-centers";
  static String getAllCentersIsSearched = "PersonApp/all-centers-custom";
  static String getAllCentersCampaigns = "PersonApp/all-center-campaigns";
  static String getAboutCenters = "PersonApp/about-center";
  static String getNotifications = "get-user-notifications";


  //? volunteer apis
  static String getMyVolunteer = "PersonApp/all-person-campaigns";
  static String sendAddVolunteerStudent = "PersonApp/join-campaign-as-student";
  static String sendAddVolunteerSupervisor =
      "PersonApp/join-campaign-as-supervisor";
      //? rate apis
  static String sendAddRateCenter = "PersonApp/make-rate-for-center";
  static String myRateCenter = "PersonApp/all-person-rated-centers";

  static String sendFeedbackCenter = "PersonApp/send-feedback-to-center";
  //? appointment apis
  static String addAppointmentInCenter = "PersonApp/add-new-appointment";
  static String deleteAppointmentInCenter = "PersonApp/cancel-appointment";
  static String myAppointmentInAllCenter = "PersonApp/all-person-appointments";

  //? this is post comments apis
  static String getPostAllCenter = "PersonApp/all-posts";
  static String getInterestsCenter = "PersonApp/all-post-interest";
  static String getCommentsCenter = "PersonApp/all-post-comments";
  static String addInterestPostInCenter = "PersonApp/make-interest-on-post";
  static String addCommentPostInCenter = "PersonApp/make-comment-on-post";
  static String code = "auth/verify";
  
}
