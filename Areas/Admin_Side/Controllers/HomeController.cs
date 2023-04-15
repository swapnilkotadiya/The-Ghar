using Microsoft.AspNetCore.Mvc;
using System.Data;
using The_Ghar.Areas.Admin_Side.Models;
using The_Ghar.BALAdmin;
using The_Ghar.DAL;

namespace The_Ghar.Areas.Admin_Side.Controllers
{
    [CheckAccess]
    [Area("Admin_Side")]
    [Route("Admin_Side/[controller]/[action]")]

    public class HomeController : Controller
    {
        Admin_Side_DAL dalHome = new Admin_Side_DAL();
        private IConfiguration Configuration;
        public HomeController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #region Home List
        public IActionResult HomeList()
        {
            DataTable dt = dalHome.dbo_PR_Home_SelectAll();
            return View("HomeList", dt);
        }
        #endregion

        #region Home Delete
        public IActionResult HomeDelete(int HomeID)
        {


            DataTable dt = dalHome.dbo_PR_Home_DeleteByPK(HomeID);

            return RedirectToAction("HomeList");

        }
        #endregion

        #region "Home Add"
        public IActionResult HomeAdd(int HomeID)
        {
            if (HomeID != null)
            {

                DataTable dt = dalHome.dbo_PR_Admin_GetValue_For_Edit(HomeID);
                HomeModel modelHome = new HomeModel();
                if (dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {

                        modelAdmin.AdminID = Convert.ToInt32(dr["AdminID"]);
                        modelAdmin.Name = (string)dr["Name"];
                        modelAdmin.Email = (string)dr["Email"];
                        modelAdmin.Password = (string)dr["Password"];
                        modelAdmin.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelAdmin.ModificationDate = Convert.ToDateTime(dr["ModificationDate"]);
                    }

                    return View("HomeAddEdit", modelHome);
                }
            }
            return View("AdminAddEdit");
        }

        #endregion

        #region "AdminSave"

        public IActionResult AdminSave(AdminModel modelAdmin)
        {



            if (modelAdmin.AdminID == 0)
            {
                DataTable dt = dalAdmin.dbo_PR_Admin_Insert(modelAdmin);
                TempData["AdminInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalAdmin.dbo_PR_Admin_UpdateByPK(modelAdmin);
                TempData["AdminUpdateMsg"] = "Record Updated Successfully";
            }



            return View("AdminAddEdit");

        }
        #endregion

    }
}
