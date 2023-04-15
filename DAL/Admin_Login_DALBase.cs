using Microsoft.AspNetCore.Mvc;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;

namespace The_Ghar.DAL
{
    public class Admin_Login_DALBase : DALHelper
    {
        #region Method: dbo_PR_AdminLogin_SelectByEmailPassword
        public DataTable dbo_PR_AdminLogin_SelectByEmailPassword(string ConnStr, string Email, string Password)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(ConnStr);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_AdminLogin_SelectByEmailPassword");
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, Email);
                sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.NVarChar, Password);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred in dbo_PR_AdminLogin_SelectByEmailPassword:");
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                return null;
            }
        }
        #endregion
    }
}
