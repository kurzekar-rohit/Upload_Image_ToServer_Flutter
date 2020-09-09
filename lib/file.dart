// class JobApplicantServices {
//   static const ROOT =
//       'http://boltwms.vsstechhacks.com/api_apply_job_applicant.php';
//   static const GET_APPLY_JOB = 'GET_APPLY_JOB';
//   static const ADD_APPLY_JOB = 'ADD_APPLY_JOB';
//   static const GET_JOB_APPLICANT_DETAILS = 'GET_JOB_APPLICANT_DETAILS';
//   static const GET_JOB_APPLICANT_STATUS = 'GET_JOB_APPLICANT_STATUS';
//   static const CHANGE_APPLICANT_JOB_STATUS = 'CHANGE_APPLICANT_JOB_STATUS';
//   static const ADD_SHORTLIST_APPLICANT = 'ADD_SHORTLIST_APPLICANT';
//   static const GET_SHORTLIST_APPLICANT = 'GET_SHORTLIST_APPLICANT';
//   static const GET_JOB_APPLICANT_INTERVIEW_STATUS =
//       'GET_JOB_APPLICANT_INTERVIEW_STATUS';
//   static const GET_REJECTED_JOB_APPLICANT_DETAILS =
//       'GET_REJECTED_JOB_APPLICANT_DETAILS';
//   static const GET_ALL_JOB_APPLICANT_DETAILS = 'GET_ALL_JOB_APPLICANT_DETAILS';
//   static const GET_SELECTED_JOB_APPLICANT_DETAILS =
//       'GET_SELECTED_JOB_APPLICANT_DETAILS';

//   // Method to add Warehouse to the database...
//   static Future<String> addApplicant(
//       String mobile_no,
//       String email_id,
//       String applicant_name,
//       String warehouse_id,
//       String job_type,
//       String job_code) async {
//     try {
//       print(mobile_no +
//           email_id +
//           applicant_name +
//           warehouse_id +
//           job_type +
//           job_code);

//       var map = Map<String, dynamic>();
//       map['action'] = ADD_APPLY_JOB;
//       map['mobile_no'] = mobile_no;
//       map['email_id'] = email_id;
//       map['applicant_name'] = applicant_name;
//       map['warehouse_id'] = warehouse_id;
//       map['job_type'] = job_type;
//       map['job_code'] = job_code;

//       final response = await http.post(ROOT, body: map);
//       print('add apply job Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         var data = json.encode({
//           'value': "ERROR",
//           'message': "Please check your connection",
//         });
//         return data;
//       }
//     } catch (e) {
//       var data = json.encode({
//         'value': "ERROR",
//         'message': "Please check your connection",
//       });
//       return data;
//     }
//   }

//   static Future<String> addShortlistApplicant(String mobile_no, String email_id,
//       String job_code, String warehouse_id, String schedule_dttm) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = ADD_SHORTLIST_APPLICANT;
//       map['mobile_no'] = mobile_no;
//       map['email_id'] = email_id;
//       map['job_code'] = job_code;
//       map['warehouse_id'] = warehouse_id;
//       map['status'] = 'Shortlisted';
//       map['schedule_dttm'] = schedule_dttm;

//       final response = await http.post(ROOT, body: map);
//       print('add apply job Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         var data = json.encode({
//           'value': "ERROR",
//           'message': "Please check your connection",
//         });
//         return data;
//       }
//     } catch (e) {
//       var data = json.encode({
//         'value': "ERROR",
//         'message': "Please check your connection",
//       });
//       return data;
//     }
//   }

//   static Future<List<JobApplicant>> getAllApplicant(
//       String email_id, String mobile_no) async {
//     try {
//       var map = Map<String, dynamic>();

//       map['action'] = GET_ALL_JOB_APPLICANT_DETAILS;
//       map['email_id'] = email_id;
//       map['mobile_no'] = mobile_no;

//       final response = await http.post(ROOT, body: map);
//       print('get All Applicant Response: ${response.body}');
//       if (200 == response.statusCode) {
//         Iterable list = json.decode(response.body)['data'];
//         var datalist = new List<JobApplicant>();
//         if (json.decode(response.body)['value'] == 'SUCCESS') {
//           datalist = list.map((model) => JobApplicant.fromJson(model)).toList();
//           return datalist;
//         } else
//           return List<JobApplicant>();
//       } else {
//         return List<JobApplicant>();
//       }
//     } catch (e) {
//       return List<JobApplicant>(); // return an empty list on exception/error
//     }
//   }
// }
