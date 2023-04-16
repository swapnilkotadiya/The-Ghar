namespace The_Ghar.Areas.Admin_Side.Models
{
    public class UserModel
    {
        public int UserID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Name { get; set; }

        public string Mobile { get; set; }

        public string Address { get; set; }
        public DateTime? RegistrationDate { get; set; }

        public DateTime? LastLoginDate { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

        public string StateName { get; set; }

        public string CityName { get; set; }

        public int StateID { get; set; }

        public int CityID { get; set; }



    }
}
