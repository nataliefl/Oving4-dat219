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
        private System.Collections.ArrayList CheckboxListSelections(System.Web.UI.WebControls.CheckBoxList list)
        {

             System.Collections.ArrayList values = new System.Collections.ArrayList();

            for (int counter = 0; counter < list.Items.Count; counter++)
            {

                if (list.Items[counter].Selected)
                {

                    values.Add(list.Items[counter].Value);

                }

            }

            return values;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem liMale = new ListItem("Male");
            ListItem liFemale = new ListItem("Female");
            ddl1.Items.Add(liMale);
            ddl1.Items.Add(liFemale);
        }

        protected void bt1Register_Click(object sender, EventArgs e)
        {

            System.Collections.ArrayList al = CheckboxListSelections(cbl1);
            if (al.Count == 0)
            {
                lblStatusSQL.Text = "No sport selected, nothing added.";
                return;
            }

            string firstName = txtName.Text;
            string lastName = txtSurname.Text;
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); 
            con.Open();  
            SqlCommand command = con.CreateCommand();                 
            command.Parameters.AddWithValue("@txtFirstName", firstName);
            command.Parameters.AddWithValue("@txtLastName", lastName);
            int medId = 0;
            try
            {
         command.CommandText = "INSERT INTO Medlemmer(Navn,Etternavn) VALUES (@txtFirstName,@txtLastName)";
         command.ExecuteNonQuery();
         command.CommandText = "SELECT TOP 1 MedNr FROM Medlemmer ORDER BY MedNr DESC";
         SqlDataReader sqlReader = command.ExecuteReader();
         while (sqlReader.Read())
         {
             medId = (int)sqlReader["MedNr"];
         }
         sqlReader.Close();        
         if (medId != 0)
         {
             
             for (int r = 0; r < al.Count; r++)
             {
                 string selectedSport = al[r].ToString();
                 command.CommandText = "INSERT INTO Sports(MedNR, Sport) VALUES(" + medId + "," + "'" + selectedSport + "'" + ")";
                 command.ExecuteNonQuery();                 
             }
             string text;
             command.CommandText = "UPDATE Medlemmer SET Kjønn=" + (text = (ddl1.SelectedValue == "Male") ? "'Male'" : "'Female'") + "WHERE MedNr=" + "'" + medId.ToString() + "'";
             command.ExecuteNonQuery();
         }
         lblStatusSQL.Text = "Member "+txtName.Text+" added.";
         txtEmail.Text = "";
         txtName.Text = "";
         txtSurname.Text = "";
         txtTelefon.Text = "";
         ddl1.SelectedIndex = 0;
         cbl1.ClearSelection();
        
               
            }
            catch (Exception ex)
            {
                lblStatusSQL.Text = ex.Message;
                throw;
            }
            finally
            {
                con.Close();
            }
        }

    }
    
}