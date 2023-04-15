namespace The_Ghar.Areas.Admin_Login.Models
{
    public class Admin_LoginModel
    {
        public int AdminID { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public DateTime? CreationDate { get; set; }

        public DateTime? ModificationDate { get; set; }

    }
}
