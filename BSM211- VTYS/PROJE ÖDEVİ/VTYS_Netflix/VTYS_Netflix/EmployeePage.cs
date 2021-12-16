using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Netflix
{
    public partial class EmployeePage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        bool bosmu;
        public void calisanGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Employees\" where \"Id\">0";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataEmployee.DataSource = ds.Tables[0];
            con.Close();
        }
        public void calisanKontrol()
        {
            if (txtAd.Text == "" || txtSoyad.Text == "" || txtMail.Text == "" || txtTelefon.Text == "" || Convert.ToInt32(cmbSehir.SelectedValue) == 0 || Convert.ToInt32(cmbDepartman.SelectedValue) == 0)
            {
                MessageBox.Show("Eksik veya hatalı giriş yaptınız. Lütfen tekrar deneyiniz!", "EKSİK ALAN!");
                bosmu = true;
            }
            else
                bosmu = false;

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
        public void sehirGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Cities\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbSehir.DisplayMember = "Name";
            cmbSehir.ValueMember = "Id";
            cmbSehir.DataSource = dt;
            con.Close();
        }
        public void ilceGetir(int cityId, NpgsqlConnection con)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cityId = Convert.ToInt32(cmbSehir.SelectedValue);
            sorgu = "select * from \"Counties\" where \"CityId\"=" + cityId;
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbIlce.DisplayMember = "Name";
            cmbIlce.ValueMember = "Id";
            cmbIlce.DataSource = dt;
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
            txtSoyad.Clear();
            txtMail.Clear();
            txtTelefon.Clear();
            cmbDepartman.SelectedIndex = 0;
            cmbSehir.SelectedIndex = 0;
        }
        public EmployeePage()
        {
            InitializeComponent();
        }

        private void EmployeePage_Load(object sender, EventArgs e)
        {
            departmanGoster(connection);
            sehirGoster(connection);
            calisanGoster(connection);
        }
        private void btnEkle_Click(object sender, EventArgs e)
        {
            calisanKontrol();
            if (bosmu == false)
            {
                sorgu = "insert into \"public\".\"Employees\" (\"DepartmentId\",\"CityId\",\"CountyId\",\"Email\",\"FirstName\",\"LastName\",\"Phone\") values (@departman,@il,@ilce,@mail,@ad,@soyad,@tel)";
                connection.Open();
                komut = new NpgsqlCommand(sorgu, connection);
                komut.Parameters.AddWithValue("@departman", Convert.ToInt32(cmbDepartman.SelectedValue));
                komut.Parameters.AddWithValue("@il", Convert.ToInt32(cmbSehir.SelectedValue));
                komut.Parameters.AddWithValue("@ilce", Convert.ToInt32(cmbIlce.SelectedValue));
                komut.Parameters.AddWithValue("@mail", txtMail.Text);
                komut.Parameters.AddWithValue("@ad", txtAd.Text);
                komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
                komut.Parameters.AddWithValue("@tel", txtTelefon.Text);
                komut.ExecuteNonQuery();
                connection.Close();
                calisanGoster(connection);
                temizle();
            }

        }
        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            calisanKontrol();
            if (bosmu == false)
            {
                sorgu = "update \"public\".\"Employees\" set \"FirstName\"=@ad,\"LastName\"=@soyad,\"Email\"=@mail,\"Phone\"=@tel,\"DepartmentId\"=@departman,\"CityId\"=@il,\"CountyId\"=@ilce where \"Id\"=" + secilenId;
                connection.Open();
                komut = new NpgsqlCommand(sorgu, connection);
                komut.Parameters.AddWithValue("@departman", Convert.ToInt32(cmbDepartman.SelectedValue));
                komut.Parameters.AddWithValue("@il", Convert.ToInt32(cmbSehir.SelectedValue));
                komut.Parameters.AddWithValue("@ilce", Convert.ToInt32(cmbIlce.SelectedValue));
                komut.Parameters.AddWithValue("@mail", txtMail.Text);
                komut.Parameters.AddWithValue("@ad", txtAd.Text);
                komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
                komut.Parameters.AddWithValue("@tel", txtTelefon.Text);
                komut.ExecuteNonQuery();
                connection.Close();
                calisanGoster(connection);
            }

        }
        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Employees\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            calisanGoster(connection);
        }
        private void dataEmployee_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataEmployee.CurrentRow.Cells[0].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataEmployee.CurrentRow.Cells[1].Value.ToString();
            txtSoyad.Text = dataEmployee.CurrentRow.Cells[2].Value.ToString();
            txtMail.Text = dataEmployee.CurrentRow.Cells[4].Value.ToString();
            txtTelefon.Text = dataEmployee.CurrentRow.Cells[3].Value.ToString();
            int departmanId = Convert.ToInt32(dataEmployee.CurrentRow.Cells[5].Value);
            int cityId = Convert.ToInt32(dataEmployee.CurrentRow.Cells[6].Value);
            int countyId = Convert.ToInt32(dataEmployee.CurrentRow.Cells[7].Value);
            cmbDepartman.SelectedValue = departmanId;
            cmbSehir.SelectedValue = cityId;
            cmbIlce.SelectedValue = countyId;
        }
        private void cmbSehir_SelectedIndexChanged(object sender, EventArgs e)
        {
            ilceGetir(Convert.ToInt32(cmbSehir.SelectedValue), connection);
        }
        private void btnGoster_Click(object sender, EventArgs e)
        {
            calisanGoster(connection);
            temizle();
        }
        private void txtAranacak_TextChanged(object sender, EventArgs e)
        {
            dataEmployee.Refresh();
            sorgu = "select * from \"Employees\" where \"FirstName\" || ' ' || \"LastName\" like '%" +
                txtAranacak.Text.ToUpper() + "%'";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataEmployee.DataSource = dt;
            dataEmployee.Refresh();
            connection.Close();
            if (txtAranacak.Text == "")
                calisanGoster(connection);
        }
        private void btnAra_Click(object sender, EventArgs e)
        {
            sorgu = "select * from GetEmployeeByDepartmentId(" + Convert.ToInt32(cmbDepartmanAra.SelectedValue) + ")";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataEmployee.DataSource = dt;
            dataEmployee.Refresh();
            connection.Close();
        }
        private void btnTemizle_Click(object sender, EventArgs e)
        {
            temizle();
        }
        private void btnEskiCalisan_Click(object sender, EventArgs e)
        {
            OldEmployeePage page = new OldEmployeePage();
            page.ShowDialog();
        }
    }
}
