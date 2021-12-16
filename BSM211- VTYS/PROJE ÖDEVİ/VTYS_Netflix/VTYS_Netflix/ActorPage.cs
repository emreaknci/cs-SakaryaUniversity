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
    public partial class ActorPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;

        public void oyuncuGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Actors\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataActor.DataSource = ds.Tables[0];
            con.Close();
        }
        public void menajerGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select \"Id\",\"FirstName\" || ' ' || \"LastName\" as \"kisi\" from \"Managers\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbMenajer.DisplayMember = "kisi";
            cmbMenajer.ValueMember = "Id";
            cmbMenajer.DataSource = dt;
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
            txtSoyad.Clear();
            cmbMenajer.SelectedIndex = 0;
        }


        public ActorPage()
        {
            InitializeComponent();
        }

        private void ActorPage_Load(object sender, EventArgs e)
        {
            oyuncuGoster(connection);
            menajerGoster(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Actors\" (\"FirstName\",\"LastName\",\"ManagerId\") values (@ad,@soyad,@menajerId)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@menajerId", Convert.ToInt32(cmbMenajer.SelectedValue));
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            oyuncuGoster(connection);
            temizle();
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Actors\" set \"FirstName\"=@ad,\"LastName\"=@soyad,\"ManagerId\"=@menajerId where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@menajerId", Convert.ToInt32(cmbMenajer.SelectedValue));
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            oyuncuGoster(connection);
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Actors\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            oyuncuGoster(connection);
        }

        private void btnFilm_Click(object sender, EventArgs e)
        {
            ActorMoviesPage page = new ActorMoviesPage();
            page.ShowDialog();
        }

        private void dataActor_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataActor.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataActor.CurrentRow.Cells["FirstName"].Value.ToString();
            txtSoyad.Text = dataActor.CurrentRow.Cells["LastName"].Value.ToString();
            int managerId = Convert.ToInt32(dataActor.CurrentRow.Cells["ManagerId"].Value);
            cmbMenajer.SelectedValue = managerId;
        }

        private void btnMenajer_Click(object sender, EventArgs e)
        {
            ManagerPage page = new ManagerPage();
            page.ShowDialog();
        }
    }
}
