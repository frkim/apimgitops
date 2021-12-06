using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [Produces("application/json")]
    public class EmployeeController : ControllerBase
    {
        private static List<Employee> _database = new List<Employee> 
        {
            new Employee{ Name = "Scott", Age = 55, Id = Guid.NewGuid() },
            new Employee{ Name = "Linda", Age = 55, Id = Guid.NewGuid() }
        };

        private readonly ILogger<EmployeeController> _logger;

        public EmployeeController(ILogger<EmployeeController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<Employee> Get()
        {
            return _database;
        }

        [HttpPost]
        public void NewEmployee(Employee employee)
        {
            employee.Id = Guid.NewGuid();
            _database.Add(employee);
        }

        [HttpDelete]
        public void DeleteEmployee(Guid id)
        {
            _database.RemoveAll(e => e.Id.Equals(id));
        }
    }
}
