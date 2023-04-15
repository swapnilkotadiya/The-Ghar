using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace The_Ghar.Areas.User_Login.Models
{
    public class User_LoginModel
    {
        public int UserID { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        [StringLength(200, MinimumLength = 10)]
        public string Address { get; set; }

        [Required]
        [StringLength(10, MinimumLength = 10)]
        public string Mobile { get; set; }

        public DateTime? RegistrationDate { get; set; }

        public DateTime? LastLoginDate { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

        public int CityID { get; set; }

        public int StateID { get; set; }




    }
    public class City_DropDownModel
    {
        public int CityID { get; set; }
        public string CityName { get; set; }


    }
    public class State_DropDownModel
    {
        public int StateID { get; set; }
        public string StateName { get; set; }
    }
}
