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
    public partial class MovieTypesPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        public MovieTypesPage()
        {
            InitializeComponent();
        }
        public void TurListele(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Types\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            listTur.DisplayMember = "Name";
            listTur.ValueMember = "Id";
            listTur.DataSource = dt;
            con.Close();
        }
        public void FilmGetir(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Movies\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbFilm.DisplayMember = "MovieName";
            cmbFilm.ValueMember = "Id";
            cmbFilm.DataSource = dt;
            con.Close();
        }
        public void FilmTurleriGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"MovieTypes\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataMovieTypes.DataSource = ds.Tables[0];
            con.Close();
        }
        private void MovieTypesPage_Load(object sender, EventArgs e)
        {
            TurListele(connection);
            FilmGetir(connection);
            FilmTurleriGoster(connection);
        }

        private void dataMovieTypes_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataMovieTypes.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            int typeId = Convert.ToInt32(dataMovieTypes.CurrentRow.Cells["TypeId"].Value);
            int filmId = Convert.ToInt32(dataMovieTypes.CurrentRow.Cells["MovieId"].Value);
            cmbFilm.SelectedValue = filmId;
            listTur.SelectedValue = typeId;
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"MovieTypes\" (\"MovieId\",\"TypeId\") values (@filmId,@turId)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@filmId", Convert.ToInt32(cmbFilm.SelectedValue));
            komut.Parameters.AddWithValue("@turId", Convert.ToInt32(listTur.SelectedValue));
            komut.ExecuteNonQuery();
            connection.Close();
            FilmTurleriGoster(connection);
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"MovieTypes\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            FilmTurleriGoster(connection);
        }

        private void btnAra_Click(object sender, EventArgs e)
        {
            sorgu = "select * from \"MovieTypesSearch\" where \"MovieId\"=" + Convert.ToInt32(cmbFilm.SelectedValue);
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataMovieTypes.DataSource = dt;
            dataMovieTypes.Refresh();
            connection.Close();
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            FilmTurleriGoster(connection);
        }


    }
}
