namespace BookingAP.Models.DBM
{
    public class UserInfo : Common
    {
        public string UserID { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;

        public string UserType { get; set; } = string.Empty;

        public string UserPassword { get; set; } = string.Empty;

        public string UserAccount { get; set; } = string.Empty;

    }

    public class UserExistRequest
    {
        public string UserPassword { get; set; } = string.Empty;

        public string UserAccount { get; set; } = string.Empty;
    }

    public class UserExistResponse
    {
        public int UserCount { get; set; }
    }
}
