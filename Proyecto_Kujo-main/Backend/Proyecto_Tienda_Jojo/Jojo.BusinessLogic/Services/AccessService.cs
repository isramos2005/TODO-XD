using Jojo.DataAccess.Repository;
using Jojo.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.BusinessLogic.Services
{
    public class AccessService
    {
        private readonly UsuarioRepository _usuarioRepository;
        private readonly PantallaPorRolRepository _pantallaPorRolRepository;


        public AccessService(
            UsuarioRepository usuarioRepository,
            PantallaPorRolRepository pantallaPorRolRepository
        )
        {
            _usuarioRepository = usuarioRepository;
            _pantallaPorRolRepository = pantallaPorRolRepository;
        }


        #region Login
        public ServiceResult Login(string user, string pass)
        {
            var result = new ServiceResult();

            var list = _usuarioRepository.Login(user, pass);
            return result.Ok(list);
        }
        #endregion

        #region PantallaPorRol
        public ServiceResult PantallasPorRol(int id)
        {
            var result = new ServiceResult();
            var list = _pantallaPorRolRepository.Menu(id);
            return result.Ok(list);
        }

        public IEnumerable<tbRoles> Roles()
        {
            var list = _pantallaPorRolRepository.Roles();
            return (list);
        }

        public ServiceResult FindRol(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _pantallaPorRolRepository.FindR(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult Pantallas(string ident)
        {
            var result = new ServiceResult();
            var list = _pantallaPorRolRepository.Pantallas(ident);
            return result.Ok(list);
        }

        public ServiceResult PantallasAgg(tbPantallasPorRol pantrole)
        {
            var result = new ServiceResult();

            try
            {
                var list = _pantallaPorRolRepository.Insert(pantrole);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult PantallasElim(int role_Id, int pant_Id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaPorRolRepository.DeleteP(role_Id, pant_Id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult PantallasChecked(int role_Id)
        {
            var result = new ServiceResult();
            var list = _pantallaPorRolRepository.PantallasChecked(role_Id);
            return result.Ok(list);
        }

        public ServiceResult InsertR(tbRoles item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _pantallaPorRolRepository.Insert(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        public ServiceResult UpdateR(tbRoles item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _pantallaPorRolRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult DeleteR(tbRoles item)
        {
            var result = new ServiceResult();
            try
            {
                var list = _pantallaPorRolRepository.Delete(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }

        }
        #endregion

        #region Usuarios

        public IEnumerable<tbUsuarios> ListUsuarios()
        {
            var list = _usuarioRepository.List();
            return ((IEnumerable<tbUsuarios>)list);
        }

        public ServiceResult InsertU(tbUsuarios item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _usuarioRepository.Insert(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult FindUsuario(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _usuarioRepository.Find(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public IEnumerable<tbEmpleados> Empleados()
        {
            var list = _usuarioRepository.Empleados();
            return (list);
        }

        public ServiceResult UpdateU(tbUsuarios item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _usuarioRepository.Update(item);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult DeleteU(int id)
        {
            var result = new ServiceResult();
            try
            {
                var list = _usuarioRepository.Delete(id);
                if (list.CodeStatus > 0)
                {
                    return result.Ok(list);
                }
                else
                {
                    list.MessageStatus = (list.CodeStatus == 0) ? "401 Error de Consulta" : list.MessageStatus;
                    return result.Error(list);

                }
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }

        }

        #endregion
    }
}
