using System.ComponentModel.DataAnnotations.Schema;

namespace BookingAP.Models.DBM
{
    public class UserInfo : CommonRequest
    {
        public string UserName { get; set; } = string.Empty;
        public string UserType { get; set; } = string.Empty;
        public string UserAccount { get; set; } = string.Empty;
        public string UserPassword { get; set; } = string.Empty;
    }

    public class UserExistRequest
    {
        public string UserAccount { get; set; } = string.Empty;
        public string UserPassword { get; set; } = string.Empty;
    }

    public class UserExistResponse
    {
        public int UserCount { get; set; }
    }

    public class UserInsertRequest
    {
        public string UserName { get; set; } = string.Empty;
        public string UserType { get; set; } = string.Empty;
        public string UserAccount { get; set; } = string.Empty;
        public string UserPassword { get; set; } = string.Empty;
    }

    public class UserInsertResponse
    {
        public int UserCount { get; set; }
    }
}
