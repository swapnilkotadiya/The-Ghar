using Microsoft.AspNetCore.Mvc;
using The_Ghar.DAL;
using The_Ghar.BALAdmin;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.Areas.User_Login.Models;

namespace The_Ghar.Areas.Admin_Side.Controllers
{
    [CheckAccess]
    [Area("Admin_Side")]
    [Route("Admin_Side/[controller]/[action]")]
    public class UserController : Controller
    {
        Admin_Side_DAL dalUSER = new Admin_Side_DAL();
        private IConfiguration Configuration;
        public UserController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region User Select All
        public IActionResult UserList()
        {
            DataTable dt = dalUSER.dbo_PR_Users_SelectAll();
            return View("UserList", dt);
        }
        #endregion

        #region User Delete
        public IActionResult UserDelete(int UserID)
        {


            DataTable dt = dalUSER.dbo_PR_Users_DeleteByPK(UserID);

            return RedirectToAction("UserList");

        }
        #endregion

        #region User Add
        public IActionResult UserAdd(int UserID)
        {
            USER_DAL dal = new USER_DAL();
            DataTable statelist = dal.dbo_PR_State_Dropdown();

            List<State_DropDownModel> list = new List<State_DropDownModel>();
            foreach (DataRow dr in statelist.Rows)
            {
                State_DropDownModel vlst = new State_DropDownModel();
                vlst.StateID = Convert.ToInt32(dr["StateID"]);
                vlst.StateName = dr["StateName"].ToString();
                list.Add(vlst);
            }

            ViewBag.StateList = list;



            List<City_DropDownModel> list2 = new List<City_DropDownModel>();
            ViewBag.CityList = list2;

            if (UserID != null)
            {

                DataTable dt = dalUSER.dbo_PR_Users_GetValue_For_Edit(UserID);
                UserModel modelUser = new UserModel();
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {

                        modelUser.UserID = Convert.ToInt32(dr["UserID"]);
                        modelUser.Name = (string)dr["Name"];
                        modelUser.Email = (string)dr["Email"];
                        modelUser.Password = (string)dr["Password"];
                        modelUser.Address = (string)dr["Address"];
                        modelUser.Mobile = (string)dr["Mobile"];
                        modelUser.StateID = Convert.ToInt32(dr["StateID"]);
                        modelUser.CityID = Convert.ToInt32(dr["CityID"]);
                        modelUser.LastLoginDate = Convert.ToDateTime(dr["LastLoginDate"]);
                        modelUser.RegistrationDate = Convert.ToDateTime(dr["RegistrationDate"]);
                        modelUser.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelUser.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);

                        DropDownByStateForCity(Convert.ToInt32(dr["StateID"]), list2);

                    }

                    return View("UserAddEdit", modelUser);
                }
            }
            return View("UserAddEdit");
        }

        #endregion

        #region Save

        public IActionResult UserSave(UserModel modelUser)
        {



            if (modelUser.UserID == 0)
            {
                DataTable dt = dalUSER.dbo_PR_Users_Insert(modelUser);
                TempData["UserInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalUSER.dbo_PR_Users_UpdateByPK(modelUser);
                TempData["UserUpdateMsg"] = "Record Updated Successfully";
            }



            return RedirectToAction("UserAdd");

        }
        #endregion

        #region "Dropdown"





        public IActionResult DropDownByStateForCity(int StateID, List<City_DropDownModel> city_list)
        {
            USER_DAL dal = new USER_DAL();
            DataTable citylist = dal.dbo_City_DropdownByStateID(StateID);
            List<City_DropDownModel> list = new List<City_DropDownModel>();
            foreach (DataRow dr in citylist.Rows)
            {
                City_DropDownModel vlst = new City_DropDownModel();
                vlst.CityID = Convert.ToInt32(dr["CityID"]);
                vlst.CityName = (string)dr["CityName"];
                city_list.Add(vlst);
            }
            ViewBag.CityList = city_list;
            var vModel = city_list;
            return Json(vModel);
        }


        #endregion

    }
}
