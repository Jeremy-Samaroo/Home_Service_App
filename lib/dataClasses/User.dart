import 'package:flutter/material.dart';

class User {
  late String user_ID;
  late String uName;
  late String userPassword;
  late String email;
  late String about;
  late String contacts;
  late String skills;
  late List<String> activeJobs;
  late List<String> completedRequests;
  late List<String> completedJobs;
  late String currentJobTaken;
  late double userRating;
  late String pfp;

  User({
    required this.user_ID,
    required this.uName,
    required this.userPassword,
    required this.email,
    required this.about,
    required this.contacts,
    required this.skills,
    required this.activeJobs,
    required this.completedRequests,
    required this.currentJobTaken,
    required this.completedJobs,
    required this.userRating,
    required this.pfp,
  });

  User.register(String userID, String name, String Uemail, String password) {
    user_ID = userID;
    uName = name;
    email = Uemail;
    userPassword = password;
    about = "Na";
    contacts = "Na";
    skills = "Na";
    activeJobs = [""];
    completedRequests = [""];
    completedJobs = [""];
    currentJobTaken = "";
    userRating = 0;
    pfp = "";
  }

  setUname(String uName) {
    this.uName = uName;
  }

  setemail(String email) {
    this.email = email;
  }

  setabout(String about) {
    this.about = about;
  }

  setcontacts(String contacts) {
    this.contacts = contacts;
  }

  setskills(String skills) {
    this.skills = skills;
  }

  setactiveRequest(List<String> activeJobs) {
    this.activeJobs = activeJobs;
  }

  setactiveJob(String currentJobTaken) {
    this.currentJobTaken = currentJobTaken;
  }

  setclientRating(var clientRating) {
    this.userRating = clientRating;
  }

  setpfp(String pfp) {
    this.pfp = pfp;
  }

  Map<String, dynamic> toJson() {
    return {
      'ID' : user_ID,
      'Name' : uName,
      'Email' : email,
      'Password' : userPassword,
      'About' : about,
      'Contacts' : contacts,
      'Skills' : skills,
      'Active_Jobs' : activeJobs,
      'Completed_Request' : completedRequests,
      'Curresnt_Job_Taken' : currentJobTaken,
      'User_Rating' : userRating,
      'Profile_Picture' : pfp
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    print('\nID : ' + this.user_ID + '\nName : ' + this.uName + '\nEmail : ' + this.email + '\nContact : ' + this.contacts + '\nAbout : ' + this.about + '\nSkils : ' + this.skills + '\nRating : ' + this.userRating.toString());
    return super.toString();
  }
}
