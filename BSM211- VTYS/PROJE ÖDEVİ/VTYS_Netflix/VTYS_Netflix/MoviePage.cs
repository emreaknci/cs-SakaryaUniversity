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
    public partial class MoviePage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        bool bosmu;
        public void filmGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Movies\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataMovie.DataSource = ds.Tables[0];
            con.Close();
        }
        public void filmKontrol()
        {
            if (txtAd.Text == "" || Convert.ToInt32(cmbCalisan.SelectedValue) == 0 || Convert.ToInt32(cmbYonetmen.SelectedValue) == 0)
            {
                MessageBox.Show("Eksik veya hatalı giriş yaptınız. Lütfen tekrar deneyiniz!", "EKSİK ALAN!");
                bosmu = true;
            }
            else
                bosmu = false;

        }
        public void calisanGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select \"Id\",\"FirstName\" || ' ' || \"LastName\" as \"kisi\" from \"Employees\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbCalisan.DisplayMember = "kisi";
            cmbCalisan.ValueMember = "Id";
            cmbCalisan.DataSource = dt;
            con.Close();
        }
        public void yonetmenGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select \"Id\",\"FirstName\" || ' ' || \"LastName\" as \"kisi\" from \"Directors\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbYonetmen.DisplayMember = "kisi";
            cmbYonetmen.ValueMember = "Id";
            cmbYonetmen.DataSource = dt;
            cmbYonetmenAra.DisplayMember = "kisi";
            cmbYonetmenAra.ValueMember = "Id";
            cmbYonetmenAra.DataSource = dt;
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
            cmbCalisan.SelectedIndex = 0;
            cmbYonetmen.SelectedIndex = 0;
            dateTimeFilm.Value = DateTime.Now;
        }
        public MoviePage()
        {
            InitializeComponent();
        }

        private void MoviePage_Load(object sender, EventArgs e)
        {
            filmGoster(connection);
            calisanGoster(connection);
            yonetmenGoster(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            filmKontrol();
            if (bosmu == false)
            {
                sorgu = "insert into \"public\".\"Movies\" (\"ReleaseDate\",\"DirectorId\",\"EmployeeId\",\"MovieName\") values (@tarih,@yonetmenId,@calisanId,@ad)";
                connection.Open();
                komut = new NpgsqlCommand(sorgu, connection);
                komut.Parameters.AddWithValue("@tarih", dateTimeFilm.Value);
                komut.Parameters.AddWithValue("@yonetmenId", Convert.ToInt32(cmbYonetmen.SelectedValue));
                komut.Parameters.AddWithValue("@calisanId", Convert.ToInt32(cmbCalisan.SelectedValue));
                komut.Parameters.AddWithValue("@ad", txtAd.Text);
                komut.ExecuteNonQuery();
                connection.Close();
                filmGoster(connection);
                temizle();
            }
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Movies\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            filmGoster(connection);
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            filmKontrol();
            if (bosmu == false)
            {
                sorgu = "update \"public\".\"Movies\" set \"MovieName\"=@ad,\"ReleaseDate\"=@tarih,\"DirectorId\"=@yonetmenId,\"EmployeeId\"=@calisanId where \"Id\"=" + secilenId;
                connection.Open();
                komut = new NpgsqlCommand(sorgu, connection);
                komut.Parameters.AddWithValue("@tarih", dateTimeFilm.Value);
                komut.Parameters.AddWithValue("@yonetmenId", Convert.ToInt32(cmbYonetmen.SelectedValue));
                komut.Parameters.AddWithValue("@calisanId", Convert.ToInt32(cmbCalisan.SelectedValue));
                komut.Parameters.AddWithValue("@ad", txtAd.Text);
                komut.ExecuteNonQuery();
                connection.Close();
                filmGoster(connection);
                temizle();
            }

        }

        private void dataMovie_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataMovie.CurrentRow.Cells[0].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataMovie.CurrentRow.Cells[1].Value.ToString();
            dateTimeFilm.Text = dataMovie.CurrentRow.Cells[2].Value.ToString();
            int directorId = Convert.ToInt32(dataMovie.CurrentRow.Cells[3].Value);
            int employeeId = Convert.ToInt32(dataMovie.CurrentRow.Cells[4].Value);
            cmbCalisan.SelectedValue = employeeId;
            cmbYonetmen.SelectedValue = directorId;
        }

        private void btnFilmTuru_Click(object sender, EventArgs e)
        {
            MovieTypesPage page = new MovieTypesPage();
            page.ShowDialog();
        }

        private void btnFilmOyuncu_Click(object sender, EventArgs e)
        {
            MovieActorsPage page = new MovieActorsPage();
            page.ShowDialog();
        }

        private void txtFilmAra_TextChanged(object sender, EventArgs e)
        {
            dataMovie.Refresh();
            sorgu = "select * from \"Movies\" where \"MovieName\" like '%" +
                txtFilmAra.Text.ToUpper() + "%'";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataMovie.DataSource = dt;
            dataMovie.Refresh();
            connection.Close();
        }

        private void btnAra_Click(object sender, EventArgs e)
        {
            sorgu = "select * from GetMovieByDirectorId("+Convert.ToInt32(cmbYonetmenAra.SelectedValue)+")";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataMovie.DataSource = dt;
            dataMovie.Refresh();
            connection.Close();
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            filmGoster(connection);
        }
    }
}
