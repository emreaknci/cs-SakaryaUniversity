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
    public partial class MovieActorsPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        public void OyuncuListele(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select \"Id\",\"FirstName\" || ' ' || \"LastName\" as \"kisi\" from \"Actors\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            listOyuncu.DisplayMember = "kisi";
            listOyuncu.ValueMember = "Id";
            listOyuncu.DataSource = dt;
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
        public void FilmOyuncularıGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"MovieActors\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataMovieActors.DataSource = ds.Tables[0];
            con.Close();
        }
        public MovieActorsPage()
        {
            InitializeComponent();
        }

        private void MovieActorsPage_Load(object sender, EventArgs e)
        {
            FilmGetir(connection);
            OyuncuListele(connection);
            FilmOyuncularıGoster(connection);
        }

        private void dataMovieActors_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataMovieActors.CurrentRow.Cells[0].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataMovieActors.CurrentRow.Cells[1].Value.ToString();
            int filmId = Convert.ToInt32(dataMovieActors.CurrentRow.Cells[2].Value);
            int actorId = Convert.ToInt32(dataMovieActors.CurrentRow.Cells[3].Value);
            cmbFilm.SelectedValue = filmId;
            listOyuncu.SelectedValue = actorId;
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"MovieActors\" (\"MovieId\",\"ActorId\",\"CharacterName\") values (@filmId,@actorId,@name)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@filmId", Convert.ToInt32(cmbFilm.SelectedValue));
            komut.Parameters.AddWithValue("@actorId", Convert.ToInt32(listOyuncu.SelectedValue));
            komut.Parameters.AddWithValue("@name",txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            FilmOyuncularıGoster(connection);
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"MovieActors\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            FilmOyuncularıGoster(connection);
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"MovieActors\" set \"CharacterName\"=@ad, \"MovieId\"=@filmId, \"ActorId\"=@actorId where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@filmId", Convert.ToInt32(cmbFilm.SelectedValue));
            komut.Parameters.AddWithValue("@actorId", Convert.ToInt32(listOyuncu.SelectedValue));
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            FilmOyuncularıGoster(connection);
        }

        private void btnAra_Click(object sender, EventArgs e)
        {
            sorgu = "select * from GetMovieActorsByMovieId("+ Convert.ToInt32(cmbFilm.SelectedValue)+")";
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataMovieActors.DataSource = dt;
            dataMovieActors.Refresh();
            connection.Close();
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            FilmOyuncularıGoster(connection);
        }
    }
}
