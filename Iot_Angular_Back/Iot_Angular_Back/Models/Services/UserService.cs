using System;
using System.Collections.Generic;
using System.Linq;
using Iot_Angular_Back.Models;
using System.Threading.Tasks;
using AutoMapper;

namespace Iot_Angular_Back.Models.Services
{
    public class UserService
    {
        private readonly ApplicationDbContext _db;
        private readonly IMapper _mapper;

        public UserService(
            IMapper mapper,
            ApplicationDbContext context)

        {
            _db = context;
            _mapper = mapper;
        }
        public async Task<Users> GetUser(int id)
        {
            Users userret = null;
            Users user = _db.users.Where(x => x.user_id == id).FirstOrDefault();
            userret = _mapper.Map<Users>(user);
            return userret;
        }

    }

}
