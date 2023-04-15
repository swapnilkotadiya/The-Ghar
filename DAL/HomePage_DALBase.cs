using Microsoft.AspNetCore.Mvc;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using The_Ghar.BAL;
using The_Ghar.DAL;

namespace The_Ghar.DAL
{
    public class HomePage_DALBase : DALHelper
    {

        #region HomeList By User's City
        public DataTable dbo_PR_HomePage_HomeList_SelectAll(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_HomePage_HomeList_SelectAll");
                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, CV.UserID());
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

    }
}
