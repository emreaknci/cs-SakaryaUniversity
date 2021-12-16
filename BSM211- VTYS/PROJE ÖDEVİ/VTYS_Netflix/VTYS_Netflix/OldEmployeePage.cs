using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Netflix
{
    public partial class OldEmployeePage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;

        public void eskiCalisanGetir(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"OldEmployees\" where \"Id\">0";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataOldEmployee.DataSource = ds.Tables[0];
            con.Close();
        }
        public void departmanGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Departments\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbDepartman.DisplayMember = "Name";
            cmbDepartman.ValueMember = "Id";
            cmbDepartman.DataSource = dt;
            cmbDepartmanAra.DisplayMember = "Name";
            cmbDepartmanAra.ValueMember = "Id";
            cmbDepartmanAra.DataSource = dt;
            con.Close();
        }

        public OldEmployeePage()
        {
            InitializeComponent();
        }

        private void OldEmployeePage_Load(object sender, EventArgs e)
        {
            eskiCalisanGetir(connection);
            departmanGoster(connection);
        }

        private void btnDepartmanAra_Click(object sender, EventArgs e)
        {
            sorgu = "select * from GetOldEmployeeByDepartmentId(" + Convert.ToInt32(cmbDepartmanAra.SelectedValue) + ")";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataOldEmployee.DataSource = dt;
            dataOldEmployee.Refresh();
            connection.Close();
        }

        private void dataOldEmployee_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataOldEmployee.CurrentRow.Cells[0].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataOldEmployee.CurrentRow.Cells[1].Value.ToString();
            txtSoyad.Text = dataOldEmployee.CurrentRow.Cells[2].Value.ToString();
            txtMail.Text = dataOldEmployee.CurrentRow.Cells[3].Value.ToString();
            txtTelefon.Text = dataOldEmployee.CurrentRow.Cells[4].Value.ToString();
            int departmanId = Convert.ToInt32(dataOldEmployee.CurrentRow.Cells[5].Value);           
            cmbDepartman.SelectedValue = departmanId;
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            eskiCalisanGetir(connection);
        }

        private void txtAranacak_TextChanged(object sender, EventArgs e)
        {
            dataOldEmployee.Refresh();
            sorgu = "select * from \"OldEmployees\" where \"FirstName\" || ' ' || \"LastName\" like '%" +
                txtAranacak.Text.ToUpper() + "%'";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataOldEmployee.DataSource = dt;
            dataOldEmployee.Refresh();
            connection.Close();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"OldEmployees\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            eskiCalisanGetir(connection);
        }
    }
}
