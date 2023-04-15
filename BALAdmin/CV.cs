using Microsoft.AspNetCore.Http;
namespace The_Ghar.BALAdmin
{
    public class CV
    {
        private static IHttpContextAccessor _httpContextAccessor;
        static CV()
        {
            _httpContextAccessor = new HttpContextAccessor();
        }

        public static string? Name()
        {
            string? Name = null;
            if (_httpContextAccessor.HttpContext.Session.GetString("Name") != null)
            {
                Name = _httpContextAccessor.HttpContext.Session.GetString("Name").ToString();
            }
            return Name;
        }

        public static int? AdminID()
        {
            int? AdminID = null;
            if (_httpContextAccessor.HttpContext.Session.GetString("AdminID") != null)
            {
                AdminID = Convert.ToInt32(_httpContextAccessor.HttpContext.Session.GetString("AdminID"));
            }
            return AdminID;
        }
    }



}
