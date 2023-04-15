using Microsoft.AspNetCore.Mvc;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.Areas.User_Login.Models;
using The_Ghar.BALAdmin;
using The_Ghar.DAL;

namespace The_Ghar.Areas.Admin_Side.Controllers
{
    [CheckAccess]
    [Area("Admin_Side")]
    [Route("Admin_Side/[controller]/[action]")]
    public class LocationController : Controller
    {
        Admin_Side_DAL dalLOC = new Admin_Side_DAL();
        private IConfiguration Configuration;
        public LocationController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region "CityList" 
        public IActionResult CityList(CityModel model, int AdminID)
        {

            DataTable dt = dalLOC.dbo_PR_City_SelectAll_By_Admin(AdminID);
            return View(dt);



        }
        #endregion

        #region "StateList"
        public IActionResult StateList(StateModel model, int AdminID)
        {
            DataTable dt = dalLOC.dbo_PR_State_SelectAll_By_Admin(AdminID);
            return View(dt);
        }
        #endregion

        #region "StateDelete"
        public IActionResult StateDelete(int StateID)
        {


            DataTable dt = dalLOC.dbo_PR_State_DeleteByPK(StateID);

            return RedirectToAction("StateList");

        }
        #endregion

        #region "StateAdd"
        public IActionResult StateAdd(int StateID)
        {
            if (StateID != null)
            {

                DataTable dt = dalLOC.dbo_PR_State_GetValue_For_Edit(StateID);
                StateModel modelState = new StateModel();
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {

                        modelState.StateID = Convert.ToInt32(dr["StateID"]);
                        modelState.StateName = (string)dr["StateName"];
                        modelState.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelState.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                    }

                    return View("StateAddEdit", modelState);
                }
            }
            return View("StateAddEdit");
        }

        #endregion

        #region "StateSave"

        public IActionResult StateSave(StateModel modelState, int AdminID)
        {



            if (modelState.StateID == 0)
            {
                DataTable dt = dalLOC.dbo_PR_State_Insert(modelState, AdminID);
                TempData["StateInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalLOC.dbo_PR_State_UpdateByPK(modelState, AdminID);
                TempData["StateUpdateMsg"] = "Record Updated Successfully";
            }



            return View("StateAddEdit");

        }
        #endregion

        #region "CityDelete"
        public IActionResult CityDelete(int CityID)
        {


            DataTable dt = dalLOC.dbo_PR_City_DeleteByPK(CityID);

            return RedirectToAction("CityList");

        }
        #endregion

        #region "StateAdd"
        public IActionResult CityAdd(int CityID)
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


            if (CityID != null)
            {

                DataTable dt = dalLOC.dbo_PR_City_GetValue_For_Edit(CityID);
                CityModel modelCity = new CityModel();
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {
                        modelCity.CityID = Convert.ToInt32(dr["CityID"]);
                        modelCity.StateID = Convert.ToInt32(dr["StateID"]);
                        modelCity.CityName = Convert.ToString(dr["CityName"]);
                        modelCity.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelCity.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                    }

                    return View("CityAddEdit", modelCity);
                }
            }
            return View("CityAddEdit");
        }

        #endregion

        #region "CitySave"


        public IActionResult CitySave(CityModel modelCity, int AdminID)
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


            if (modelCity.CityID == 0)
            {
                DataTable dt = dalLOC.dbo_PR_City_Insert(modelCity, AdminID);
                TempData["CityInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalLOC.dbo_PR_City_UpdateByPK(modelCity);
                TempData["CityUpdateMsg"] = "Record Updated Successfully";
            }



            return View("CityAddEdit");

        }
        #endregion
    }
}

