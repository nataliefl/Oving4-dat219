using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DbForms
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem liMale = new ListItem("Male");
            ListItem liFemale = new ListItem("Female");
            ddl1.Items.Add(liMale);
            ddl1.Items.Add(liFemale);


        }

        protected void bt1Register_Click(object sender, EventArgs e)
        {
             string firstName = txtName.Text;
            string lastName = txtSurname.Text;
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); 
            con.Open();  
            SqlCommand command = con.CreateCommand();           
            SqlTransaction sqlTrans = con.BeginTransaction();
            command.Connection = con;
            command.Transaction = sqlTrans;
            command.Parameters.AddWithValue("@txtFirstName", firstName);
            command.Parameters.AddWithValue("@txtLastName", lastName);
            int medId;
            try
            {
         command.CommandText = "INSERT INTO Medlemmer(Navn,Etternavn) VALUES (@txtFirstName,@txtLastName)";
         command.ExecuteNonQuery();
         command.CommandText = "SELECT TOP 1 MedNr FROM Medlemmer ORDER BY MedNr DESC";
         sqlTrans.Commit();
         SqlDataReader sqlReader = command.ExecuteReader();
         medId = (int)sqlReader[0];
         con.Close();
            }
            catch (Exception)
            {
                sqlTrans.Rollback();
                throw;
            }
            finally
            {
                con.Close();
            }
        }

    }
}