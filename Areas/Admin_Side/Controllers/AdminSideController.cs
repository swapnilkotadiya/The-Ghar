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
    public class AdminSideController : Controller

    {
        Admin_Side_DAL dalAdmin = new Admin_Side_DAL();

        public IActionResult AdminSide()
        {
            return View();
        }

        #region "AdminList"
        public IActionResult AdminList(AdminModel model)
        {

            DataTable dt = dalAdmin.dbo_PR_Admin_SelectAll();
            return View(dt);
        }
        #endregion

        #region "AdminDelete"
        public IActionResult AdminDelete(int AdminID)
        {


            DataTable dt = dalAdmin.dbo_PR_Admin_DeleteByPK(AdminID);

            return RedirectToAction("AdminList");

        }
        #endregion

        #region "AdminAdd"
        public IActionResult AdminAdd(int AdminID)
        {
            if (AdminID != null)
            {

                DataTable dt = dalAdmin.dbo_PR_Admin_GetValue_For_Edit(AdminID);
                AdminModel modelAdmin = new AdminModel();
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

                    return View("AdminAddEdit", modelAdmin);
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
