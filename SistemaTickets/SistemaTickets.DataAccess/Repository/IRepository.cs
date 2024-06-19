using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaTickets.DataAccess.Repository
{
    internal interface IRepository<T>
    {
        public IEnumerable<T> List();
        public int Insert(T item);
        public int Update(T item);
        public T find(int? id);
        public int Delete(T item);
    }
}
